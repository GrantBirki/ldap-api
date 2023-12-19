# frozen_string_literal: true

require "config"
require "active_ldap"
require "redacting_logger"

module LdapApi
  module LdapSettings
    def self.setup(config: nil, logger: nil)
      # load and validate config
      Config.load_and_set_settings(config)
      settings = Settings.ldap.connection.to_hash
      validate_config

      # setup a logger
      settings[:logger] = logger

      # bind to LDAP
      settings[:allow_anonymous] = false unless settings.key? :allow_anonymous
      ActiveLdap::Base.setup_connection(settings)

      require "./lib/ldap_api/active_ldap"
      require "./lib/ldap_api/api/entities"
    end

    def self.validate_config
      h = Settings.to_hash
      h.assert_valid_keys(:ldap)
      h[:ldap].assert_valid_keys(:connection, :cache, :limit_results, :user, :group)
      _c = h[:ldap][:connection]
      %i[host base].each do |k|
        raise(ArgumentError, "Need ldap.connection.key: #{k}") unless h[:ldap][:connection].key?(k)
      end
      %i[dn_attribute classes attributes].each do |k|
        raise(ArgumentError, "Need key: ldap.user.#{k}") unless h[:ldap][:user].key?(k)
      end
      %i[dn_attribute classes member_attribute user_membership_attribute attributes].each do |k|
        raise(ArgumentError, "Need key: ldap.group.#{k}") unless h[:ldap][:group].key?(k)
      end
    end
  end
end
