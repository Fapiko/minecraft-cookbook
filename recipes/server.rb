#
# Cookbook Name:: minecraft
# Recipe:: server
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:minecraft][:base_dir]}/server" do
  recursive true
  mode 0755
end

remote_file "#{node[:minecraft][:base_dir]}/server/minecraft_server.jar" do
  source 'https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar'
  mode 0644
  action :create_if_missing
end

template "#{node[:minecraft][:base_dir]}/server/server.sh" do
  source 'server.sh.erb'
  mode 0755
end
