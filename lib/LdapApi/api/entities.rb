# frozen_string_literal: true

require "grape"
require "grape-entity"

module LdapApi
  module API
    class User < Grape::Entity
      Settings.ldap.user.attributes.to_hash.each do |ldap, service|
        expose ldap, as: service
      end
    end

    class Group < Grape::Entity
      Settings.ldap.group.attributes.to_hash.each do |ldap, service|
        expose ldap, as: service
      end
    end
  end
end
