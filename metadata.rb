name "multimc"
maintainer "Thomas Boerger"
maintainer_email "tboerger@tbpro.de"
license "Apache 2.0"
description "Installs/Configures multimc"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "0.1.0"
depends "java"
recipe "multimc", "Installs/Configures multimc"

supports "suse", ">= 12.3"
supports "debian", ">= 7.0"
supports "ubuntu", ">= 12.04"
