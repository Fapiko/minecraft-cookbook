#
# Cookbook Name:: minecraft
# Attributes:: default
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

default[:minecraft][:deployment] = 'application'
default[:minecraft][:base_dir] = '/opt/minecraft'
default[:minecraft][:craftbukkit][:server_jar] = 'https://dl.dropbox.com/u/50768347/craftbukkit-1.4.6-R0.1.jar'
default[:minecraft][:craftbukkit][:server_jar_checksum] = 'b845e55348068069bd8709254e18987bdf6b7a15767e348dc02abc0a0ff35b61'
default[:minecraft][:server][:heap_min_ram] = '4G'
default[:minecraft][:server][:heap_max_ram] = '8G'
default[:minecraft][:server][:ops] = [:fapiko, :skittydog]
default[:minecraft][:user] = 'minecraft'
default[:minecraft][:group] = 'minecraft'
default[:minecraft][:plugins][:load] = [:dynmap, :mctelnet]

default[:minecraft][:servers][0][:name] = "Lucas's Server"
default[:minecraft][:servers][0][:parse_name] = 'lucas_server'
default[:minecraft][:servers][0][:port] = 3000
default[:minecraft][:servers][0][:memory] = '1024M'