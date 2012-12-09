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
  owner 'minecraft'
  group 'minecraft'
end

user 'minecraft' do
  system true
  shell '/bin/false'
end

group 'minecraft' do
  members ['minecraft']
  system true
end

remote_file "#{node[:minecraft][:base_dir]}/server/minecraft_server.jar" do
  source 'https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar'
  mode 0644
  user 'minecraft'
  group 'minecraft'
  action :create_if_missing
end

template "#{node[:minecraft][:base_dir]}/server/server.sh" do
  source 'server.sh.erb'
  mode 0755
  user 'minecraft'
  group 'minecraft'
end

template '/etc/init/minecraft.conf' do
  source 'init/minecraft.conf.erb'
  mode 0644
end
