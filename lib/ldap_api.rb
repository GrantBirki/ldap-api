# frozen_string_literal: true

require "garner"
require_relative "ldap_api/settings"
require_relative "ldap_api/api"
require "redacting_logger"

# construct a logger for the application
$stdout.sync = true # don't buffer, flush immediately
logger = RedactingLogger.new(
  $stdout, # The device to log to (defaults to $stdout if not provided)
  # redact_patterns: [/REDACTED_PATTERN1/, /REDACTED_PATTERN2/], # An array of Regexp patterns to redact from the logs
  level: ENV.fetch("LOG_LEVEL", "INFO").upcase, # The log level to use
  redacted_msg: "[REDACTED]", # The message to replace the redacted patterns with
  use_default_patterns: true # Whether to use the default built-in patterns or not
)

# fetch the config file path from the environment
config = ENV.fetch("CONFIG_PATH", "./config/config.example.yml")

# load application config and setup the ldap-api
begin
  LdapApi::LdapSettings.setup(config:, logger:)
rescue NoMethodError, ArgumentError => e
  logger.error("failed to load application config: #{e.message}")
  raise e
end

# configure the ldap-api cache
begin
  Garner.config.expires_in = Settings.ldap.cache.ttl
rescue NoMethodError
  fallback_ttl = 1800
  logger.warn("no ldap.cache.ttl found in config, using fallback value: #{fallback_ttl}")
  Garner.config.expires_in = fallback_ttl
end
