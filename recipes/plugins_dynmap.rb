#
# Cookbook Name:: minecraft
# Recipe:: plugins_dynmap
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap.jar" do
  source 'http://dev.bukkit.org/media/files/656/83/dynmap-1.2-bin.zip'
  mode 0644
  user 'minecraft'
  group 'minecraft'
  action :create_if_missing
end

directory "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap" do
  mode 0755
  owner 'minecraft'
  group 'minecraft'
end

template "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap/configuration.txt" do
  source 'plugins/dynmap/configuration.txt.erb'
  mode 0744
  user 'minecraft'
  group 'minecraft'
end