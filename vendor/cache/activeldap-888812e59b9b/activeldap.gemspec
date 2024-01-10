# -*- encoding: utf-8 -*-
# stub: activeldap 6.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "activeldap".freeze
  s.version = "6.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Will Drewry".freeze, "Kouhei Sutou".freeze]
  s.date = "2024-01-10"
  s.description = "    'ActiveLdap' is a ruby library which provides a clean\n    objected oriented interface to the Ruby/LDAP library.  It was inspired\n    by ActiveRecord. This is not nearly as clean or as flexible as\n    ActiveRecord, but it is still trivial to define new objects and manipulate\n    them with minimal difficulty.\n".freeze
  s.email = ["redpig@dataspill.org".freeze, "kou@cozmixng.org".freeze]
  s.files = [".yardopts".freeze, "COPYING".freeze, "Gemfile".freeze, "LICENSE".freeze, "TODO".freeze, "benchmark/README.md".freeze, "benchmark/bench-backend.rb".freeze, "benchmark/bench-instantiate.rb".freeze, "benchmark/config.yaml.sample".freeze, "doc/text/development.md".freeze, "doc/text/news.md".freeze, "doc/text/rails.md".freeze, "doc/text/tutorial.md".freeze, "examples/config.yaml.example".freeze, "examples/example.der".freeze, "examples/example.jpg".freeze, "examples/groupadd".freeze, "examples/groupdel".freeze, "examples/groupls".freeze, "examples/groupmod".freeze, "examples/lpasswd".freeze, "examples/objects".freeze, "examples/objects/group.rb".freeze, "examples/objects/ou.rb".freeze, "examples/objects/user.rb".freeze, "examples/ouadd".freeze, "examples/useradd".freeze, "examples/useradd-binary".freeze, "examples/userdel".freeze, "examples/userls".freeze, "examples/usermod".freeze, "examples/usermod-binary-add".freeze, "examples/usermod-binary-add-time".freeze, "examples/usermod-binary-del".freeze, "examples/usermod-lang-add".freeze, "lib/active_ldap".freeze, "lib/active_ldap.rb".freeze, "lib/active_ldap/acts".freeze, "lib/active_ldap/acts/tree.rb".freeze, "lib/active_ldap/adapter".freeze, "lib/active_ldap/adapter/base.rb".freeze, "lib/active_ldap/adapter/jndi.rb".freeze, "lib/active_ldap/adapter/jndi_connection.rb".freeze, "lib/active_ldap/adapter/ldap.rb".freeze, "lib/active_ldap/adapter/ldap_ext.rb".freeze, "lib/active_ldap/adapter/net_ldap.rb".freeze, "lib/active_ldap/adapter/net_ldap_ext.rb".freeze, "lib/active_ldap/association".freeze, "lib/active_ldap/association/belongs_to.rb".freeze, "lib/active_ldap/association/belongs_to_many.rb".freeze, "lib/active_ldap/association/children.rb".freeze, "lib/active_ldap/association/collection.rb".freeze, "lib/active_ldap/association/has_many.rb".freeze, "lib/active_ldap/association/has_many_utils.rb".freeze, "lib/active_ldap/association/has_many_wrap.rb".freeze, "lib/active_ldap/association/proxy.rb".freeze, "lib/active_ldap/associations.rb".freeze, "lib/active_ldap/attribute_methods".freeze, "lib/active_ldap/attribute_methods.rb".freeze, "lib/active_ldap/attribute_methods/before_type_cast.rb".freeze, "lib/active_ldap/attribute_methods/dirty.rb".freeze, "lib/active_ldap/attribute_methods/query.rb".freeze, "lib/active_ldap/attribute_methods/read.rb".freeze, "lib/active_ldap/attribute_methods/write.rb".freeze, "lib/active_ldap/attributes.rb".freeze, "lib/active_ldap/base.rb".freeze, "lib/active_ldap/callbacks.rb".freeze, "lib/active_ldap/command.rb".freeze, "lib/active_ldap/compatible.rb".freeze, "lib/active_ldap/configuration.rb".freeze, "lib/active_ldap/connection.rb".freeze, "lib/active_ldap/distinguished_name.rb".freeze, "lib/active_ldap/entry.rb".freeze, "lib/active_ldap/entry_attribute.rb".freeze, "lib/active_ldap/escape.rb".freeze, "lib/active_ldap/get_text".freeze, "lib/active_ldap/get_text.rb".freeze, "lib/active_ldap/get_text/parser.rb".freeze, "lib/active_ldap/helper.rb".freeze, "lib/active_ldap/human_readable.rb".freeze, "lib/active_ldap/ldap_controls.rb".freeze, "lib/active_ldap/ldap_error.rb".freeze, "lib/active_ldap/ldif.rb".freeze, "lib/active_ldap/log_subscriber.rb".freeze, "lib/active_ldap/object_class.rb".freeze, "lib/active_ldap/operations.rb".freeze, "lib/active_ldap/persistence.rb".freeze, "lib/active_ldap/populate.rb".freeze, "lib/active_ldap/railtie.rb".freeze, "lib/active_ldap/railties".freeze, "lib/active_ldap/railties/controller_runtime.rb".freeze, "lib/active_ldap/schema".freeze, "lib/active_ldap/schema.rb".freeze, "lib/active_ldap/schema/syntaxes.rb".freeze, "lib/active_ldap/supported_control.rb".freeze, "lib/active_ldap/user_password.rb".freeze, "lib/active_ldap/validations.rb".freeze, "lib/active_ldap/version.rb".freeze, "lib/active_ldap/xml.rb".freeze, "lib/rails".freeze, "lib/rails/generators".freeze, "lib/rails/generators/active_ldap".freeze, "lib/rails/generators/active_ldap/model".freeze, "lib/rails/generators/active_ldap/model/USAGE".freeze, "lib/rails/generators/active_ldap/model/model_generator.rb".freeze, "lib/rails/generators/active_ldap/model/templates".freeze, "lib/rails/generators/active_ldap/model/templates/model_active_ldap.rb".freeze, "lib/rails/generators/active_ldap/scaffold".freeze, "lib/rails/generators/active_ldap/scaffold/scaffold_generator.rb".freeze, "lib/rails/generators/active_ldap/scaffold/templates".freeze, "lib/rails/generators/active_ldap/scaffold/templates/ldap.yml".freeze, "po/en".freeze, "po/en/active-ldap.po".freeze, "po/ja".freeze, "po/ja/active-ldap.po".freeze, "test/add-phonetic-attribute-options-to-slapd.ldif".freeze, "test/al-test-utils.rb".freeze, "test/command.rb".freeze, "test/config.yaml.sample".freeze, "test/enable-dynamic-groups.ldif".freeze, "test/enable-start-tls.ldif".freeze, "test/fixtures/lower_case_object_class_schema.rb".freeze, "test/run-test.rb".freeze, "test/test_acts_as_tree.rb".freeze, "test/test_adapter.rb".freeze, "test/test_associations.rb".freeze, "test/test_attributes.rb".freeze, "test/test_base.rb".freeze, "test/test_base_per_instance.rb".freeze, "test/test_bind.rb".freeze, "test/test_callback.rb".freeze, "test/test_configuration.rb".freeze, "test/test_connection.rb".freeze, "test/test_connection_per_class.rb".freeze, "test/test_connection_per_dn.rb".freeze, "test/test_dirty.rb".freeze, "test/test_dn.rb".freeze, "test/test_entry.rb".freeze, "test/test_entry_attribute.rb".freeze, "test/test_find.rb".freeze, "test/test_groupadd.rb".freeze, "test/test_groupdel.rb".freeze, "test/test_groupls.rb".freeze, "test/test_groupmod.rb".freeze, "test/test_ldif.rb".freeze, "test/test_load.rb".freeze, "test/test_lpasswd.rb".freeze, "test/test_object_class.rb".freeze, "test/test_persistence.rb".freeze, "test/test_reflection.rb".freeze, "test/test_schema.rb".freeze, "test/test_supported_control.rb".freeze, "test/test_syntax.rb".freeze, "test/test_user.rb".freeze, "test/test_user_password.rb".freeze, "test/test_useradd-binary.rb".freeze, "test/test_useradd.rb".freeze, "test/test_userdel.rb".freeze, "test/test_userls.rb".freeze, "test/test_usermod-binary-add-time.rb".freeze, "test/test_usermod-binary-add.rb".freeze, "test/test_usermod-binary-del.rb".freeze, "test/test_usermod-lang-add.rb".freeze, "test/test_usermod.rb".freeze, "test/test_validation.rb".freeze]
  s.homepage = "http://activeldap.github.io/".freeze
  s.licenses = ["Ruby's".freeze, "GPLv2 or later".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "ActiveLdap is a object-oriented API to LDAP".freeze
  s.test_files = ["test/add-phonetic-attribute-options-to-slapd.ldif".freeze, "test/al-test-utils.rb".freeze, "test/command.rb".freeze, "test/config.yaml.sample".freeze, "test/enable-dynamic-groups.ldif".freeze, "test/enable-start-tls.ldif".freeze, "test/fixtures/lower_case_object_class_schema.rb".freeze, "test/run-test.rb".freeze, "test/test_acts_as_tree.rb".freeze, "test/test_adapter.rb".freeze, "test/test_associations.rb".freeze, "test/test_attributes.rb".freeze, "test/test_base.rb".freeze, "test/test_base_per_instance.rb".freeze, "test/test_bind.rb".freeze, "test/test_callback.rb".freeze, "test/test_configuration.rb".freeze, "test/test_connection.rb".freeze, "test/test_connection_per_class.rb".freeze, "test/test_connection_per_dn.rb".freeze, "test/test_dirty.rb".freeze, "test/test_dn.rb".freeze, "test/test_entry.rb".freeze, "test/test_entry_attribute.rb".freeze, "test/test_find.rb".freeze, "test/test_groupadd.rb".freeze, "test/test_groupdel.rb".freeze, "test/test_groupls.rb".freeze, "test/test_groupmod.rb".freeze, "test/test_ldif.rb".freeze, "test/test_load.rb".freeze, "test/test_lpasswd.rb".freeze, "test/test_object_class.rb".freeze, "test/test_persistence.rb".freeze, "test/test_reflection.rb".freeze, "test/test_schema.rb".freeze, "test/test_supported_control.rb".freeze, "test/test_syntax.rb".freeze, "test/test_user.rb".freeze, "test/test_user_password.rb".freeze, "test/test_useradd-binary.rb".freeze, "test/test_useradd.rb".freeze, "test/test_userdel.rb".freeze, "test/test_userls.rb".freeze, "test/test_usermod-binary-add-time.rb".freeze, "test/test_usermod-binary-add.rb".freeze, "test/test_usermod-binary-del.rb".freeze, "test/test_usermod-lang-add.rb".freeze, "test/test_usermod.rb".freeze, "test/test_validation.rb".freeze]

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activemodel>.freeze, [">= 5.2"])
    s.add_runtime_dependency(%q<locale>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<gettext>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<gettext_i18n_rails>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<builder>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<kramdown>.freeze, [">= 0"])
    s.add_development_dependency(%q<packnga>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activemodel>.freeze, [">= 5.2"])
    s.add_dependency(%q<locale>.freeze, [">= 0"])
    s.add_dependency(%q<gettext>.freeze, [">= 0"])
    s.add_dependency(%q<gettext_i18n_rails>.freeze, [">= 0"])
    s.add_dependency(%q<builder>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<kramdown>.freeze, [">= 0"])
    s.add_dependency(%q<packnga>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end