#
# Cookbook Name:: minecraft
# Attributes:: plugins_mctelnet
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

default[:minecraft][:plugins][:mctelnet][:plugin_jar] = 'https://dl.dropbox.com/u/50768347/MCTelnet.jar'
default[:minecraft][:plugins][:mctelnet][:plugin_jar_checksum] = '5fca4428f645a39914407bf533e4919ec98a87ba63ed94ea8641fbf78c39effc'
default[:minecraft][:plugins][:mctelnet][:allow_authless_localhost] = false
default[:minecraft][:plugins][:mctelnet][:root_password] = 'changeme'
