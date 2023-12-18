# frozen_string_literal: true

require "garner"
require_relative "ldap2rest/settings"
require_relative "ldap2rest/api"

begin
  Ldap2Rest::LdapSettings.setup ENV.fetch("CONFIG_PATH", "./config/config.example.yml")
rescue NoMethodError, ArgumentError => e
  puts "\nConfig file error!!! Please read documentation or check with default config file\n\n"
  raise e
end

# Garner::Cache::ObjectIdentity::KEY_STRATEGIES = [
#   Garner::Strategies::Keys::RequestPath,
#   Garner::Strategies::Keys::RequestGet
# ]

begin
  Garner.config.expires_in = Settings.ldap.cache.ttl
rescue NoMethodError
  Garner.config.expires_in = 1800
end
