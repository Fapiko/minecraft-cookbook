#
# Cookbook Name:: minecraft
# Recipe:: plugins_mctelnet
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/mctelnet.jar" do
  source node[:minecraft][:plugins][:mctelnet][:plugin_jar]
  checksum node[:minecraft][:plugins][:mctelnet][:plugin_jar_checksum]
  user node[:minecraft][:user]
  group node[:minecraft][:user]
end

directory "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/mctelnet" do
  mode 0755
  user node[:minecraft][:user]
  group node[:minecraft][:user]
end

template "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/mctelnet/config.yml" do
  source 'plugins/mctelnet/config.yml.erb'
  mode 0644
  user node[:minecraft][:user]
  group node[:minecraft][:user]
end
