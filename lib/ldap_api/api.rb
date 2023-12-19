# frozen_string_literal: true

require "grape"
require "garner/mixins/rack"

module LdapApi
  module API
    class LDAP < Grape::API
      helpers Garner::Mixins::Rack

      version "v1", using: :path
      format :json
      default_format :json

      rescue_from :all

      helpers do
        def build_filter(model, value)
          value ||= "*"
          filter = Settings.ldap.send(model).filter
          filter.gsub("%s", value) if filter.is_a?(String)
        end
      end

      resource :users do
        desc "Returns a list of users from LDAP. List might be truncated if LDAP server limits response size"
        get do
          @users = garner do
            filter ||= build_filter(:user, params[:filter])
            LdapApi::User.find(:all, { filter:, limit: Settings.ldap.limit_results }).collect(&:to_os)
          end
          present @users, with: LdapApi::API::User
        end

        desc "Returns a single user matching specified username"
        get ":username" do
          params do
            requires :username, type: String, desc: "username to be fetched"
          end
          @user = garner do
            @user = LdapApi::User.find(:first, params[:username])
            @user&.to_os
          end
          present @user, with: LdapApi::API::User
        end

        get ":username/groups" do
          params do
            requires :username, type: String, desc: "username to be fetched"
          end
          @groups = garner do
            LdapApi::User.find(:first, params[:username]).groups.collect(&:to_os)
          end
          present @groups, with: LdapApi::API::Group
        end
      end

      resource :groups do
        desc "Returns a list of groups from LDAP. List might be truncated if LDAP server limits response size"
        get do
          @groups = garner do
            filter ||= build_filter(:group, params[:filter])
            LdapApi::Group.find(:all, { filter:, limit: Settings.ldap.limit_results }).collect(&:to_os)
          end
          present @groups, with: LdapApi::API::Group
        end

        desc "Returns a list of groups from LDAP matching specified filter"
        get ":name/members" do
          params do
            requires :filter, type: String, desc: "filter by group name. Wildcard(*) should be used"
          end
          @users = garner do
            LdapApi::Group.find(:first, params[:name]).members.collect(&:to_os)
          end
          present @users, with: LdapApi::API::User
        end
      end
    end
  end
end
