# frozen_string_literal: true

module Ldap2Rest
  module LdapSettings
    def self.setup(path = "./config/config.yml")
      RailsConfig.load_and_set_settings path
      settings = Settings.ldap.connection.to_hash
      validate_config
      settings[:logger] = Logger.new($stderr)
      settings[:logger].level = Logger::DEBUG
      settings[:allow_anonymous] = false unless settings.key? :allow_anonymous
      ActiveLdap::Base.setup_connection settings
      require "./lib/ldap2rest/active_ldap"
      require "./lib/ldap2rest/api/entities"
    end

    def self.validate_config
      h = Settings.to_hash
      h.assert_valid_keys(:ldap)
      h[:ldap].assert_valid_keys(:connection, :cache, :limit_results, :user, :group)
      c = h[:ldap][:connection]
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
