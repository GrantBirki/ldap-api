# frozen_string_literal: true

require "config"
require "active_ldap"
require "redacting_logger"

module LdapApi
  module LdapSettings
    # Helper function to load and validate the application config
    # :param config: the path to the application config (String)
    # :param logger: the application logger (RedactingLogger)
    def self.setup(config: nil, logger: nil)
      # load and validate config
      Config.load_and_set_settings(config)
      settings = Settings.ldap.connection.to_hash
      validate_config(Settings.to_hash, logger)

      # setup a logger
      settings[:logger] = logger

      # bind to LDAP
      settings[:allow_anonymous] = false unless settings.key? :allow_anonymous

      # append the password to the settings hash from the environment
      # plain text passwords should never live in config files
      settings[:password] = ENV.fetch("LDAP_PASSWORD", nil)

      ActiveLdap::Base.setup_connection(settings)

      require "./lib/ldap_api/active_ldap"
      require "./lib/ldap_api/api/entities"
    end

    # Helper function to ensure the application config is valid
    # :param config: the application config (Hash)
    # :param logger: the application logger (RedactingLogger)
    # :return: nil - raises an exception if the config is invalid
    def self.validate_config(config, logger)
      logger.info("validating config")

      config.assert_valid_keys(:ldap)
      config[:ldap].assert_valid_keys(:connection, :cache, :limit_results, :user, :group)

      validate_ldap_connection(config)
      validate_ldap_user(config)
      validate_ldap_group(config)

      logger.info("config validation successful")
    end

    # Helper function to ensure the ldap.connection key is valid
    # :param config: the application config (Hash)
    def self.validate_ldap_connection(config)
      raise(ArgumentError, "need ldap.connection") unless config[:ldap].key?(:connection)

      %i[host base].each do |k|
        raise(ArgumentError, "need ldap.connection.key: #{k}") unless config[:ldap][:connection].key?(k)
      end
    end

    # Helper function to ensure the ldap.user key is valid
    # :param config: the application config (Hash)
    def self.validate_ldap_user(config)
      %i[dn_attribute classes attributes].each do |k|
        raise(ArgumentError, "need key: ldap.user.#{k}") unless config[:ldap][:user].key?(k)
      end
    end

    # Helper function to ensure the ldap.group key is valid
    # :param config: the application config (Hash)
    def self.validate_ldap_group(config)
      %i[dn_attribute classes member_attribute user_membership_attribute attributes].each do |k|
        raise(ArgumentError, "need key: ldap.group.#{k}") unless config[:ldap][:group].key?(k)
      end
    end
  end
end
