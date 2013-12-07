class ruby_on_rails {
  class { 'rvm': }

  rvm_system_ruby {
    'ruby-1.9.3-p484':
    ensure => 'present',
    default_use => true;
  }

  rvm_gem {
    'bundler':
    name => 'bundler',
    ensure => latest,
    ruby_version => 'ruby-1.9.3-p484',
    require => Rvm_system_ruby['ruby-1.9.3-p484'];
  }

  rvm_gem {
    'rails':
    name => 'rails',
    ensure => latest,
    ruby_version => 'ruby-1.9.3-p484',
    require => Rvm_system_ruby['ruby-1.9.3-p484'];
  }
}

class redis_default {
  class { 'redis':
    version => '2.6.5',
  }
}

node "dev-box-standard" {
  include ruby_on_rails
  include redis_default
}