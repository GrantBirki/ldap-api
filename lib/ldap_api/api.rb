# frozen_string_literal: true

require "grape"
require "garner/mixins/rack"
require "redacting_logger"

module LdapApi
  module API
    class LDAP < Grape::API
      helpers Garner::Mixins::Rack

      $stdout.sync = true # don't buffer, flush immediately for logs

      helpers do
        def build_filter(model, value)
          value ||= "*"
          filter = Settings.ldap.send(model).filter
          filter.gsub("%s", value) if filter.is_a?(String)
        end

        # setup a custom logger with the Grape API
        def logger
          RedactingLogger.new(
            $stdout, # The device to log to (defaults to $stdout if not provided)
            level: ENV.fetch("LOG_LEVEL", "INFO").upcase, # The log level to use
            redacted_msg: "[REDACTED]", # The message to replace the redacted patterns with
            use_default_patterns: true # Whether to use the default built-in patterns or not
          )
        end
      end

      version "v1", using: :path
      format :json
      default_format :json

      rescue_from :all

      after do
        # if the request is using caching logic, add the `Cache-Ttl` header to the reponse
        # this header indicates how many seconds are left before the cache expires
        if @cached_at
          elapsed_time = Time.now - @cached_at
          remaining_ttl = Settings.ldap.cache.ttl - elapsed_time.to_i
          header "Cache-TTL", remaining_ttl.to_s
        end

        if status == 200
          # if the request was successful, log the request
          logger.info("200 OK #{request.request_method} #{request.path} #{request.params}")
        else
          # this API only returns 200s so if the request was not successful, log the error
          logger.error("#{status} #{request.request_method} #{request.path} #{request.params}")
        end
      end

      # health check endpoint
      get :health do
        { status: "OK" }
      end

      resource :users do
        desc "Returns a list of users from LDAP. List might be truncated if LDAP server limits response size"
        get do
          @users, @cached_at = garner do
            filter ||= build_filter(:user, params[:filter])
            [LdapApi::User.find(:all, { filter:, limit: Settings.ldap.limit_results }).collect(&:to_os), Time.now]
          end

          present @users, with: LdapApi::API::User
        end

        desc "Returns a single user matching specified username"
        get ":username" do
          params do
            requires :username, type: String, desc: "username to be fetched"
          end

          @user, @cached_at = garner do
            @user = LdapApi::User.find(:first, params[:username])
            [@user&.to_os, Time.now]
          end

          present @user, with: LdapApi::API::User
        end

        get ":username/groups" do
          params do
            requires :username, type: String, desc: "username to be fetched"
          end

          @groups, @cached_at = garner do
            [LdapApi::User.find(:first, params[:username]).groups.collect(&:to_os), Time.now]
          end

          present @groups, with: LdapApi::API::Group
        end
      end

      resource :groups do
        desc "Returns a list of groups from LDAP. List might be truncated if LDAP server limits response size"
        get do
          @groups, @cached_at = garner do
            filter ||= build_filter(:group, params[:filter])
            [LdapApi::Group.find(:all, { filter:, limit: Settings.ldap.limit_results }).collect(&:to_os), Time.now]
          end

          present @groups, with: LdapApi::API::Group
        end

        desc "Returns a list of groups from LDAP matching specified filter"
        get ":name/members" do
          params do
            requires :filter, type: String, desc: "filter by group name. Wildcard(*) should be used"
          end

          @users, @cached_at = garner do
            [LdapApi::Group.find(:first, params[:name]).members.collect(&:to_os), Time.now]
          end

          present @users, with: LdapApi::API::User
        end
      end
    end
  end
end
