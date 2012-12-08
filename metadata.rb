name             "minecraft"
maintainer       "Lucas Jandrew"
maintainer_email "lucas@jandrew.com"
license          "All rights reserved"
description      "Installs/Configures minecraft"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

depends 'java'
