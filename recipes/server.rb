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

remote_file "#{node[:minecraft][:base_dir]}/server/craftbukkit-beta.jar" do
  source 'http://cbukk.it/craftbukkit-beta.jar'
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

template "#{node[:minecraft][:base_dir]}/server/craftbukkit-runner.sh" do
  source 'craftbukkit-runner.sh.erb'
  mode 0755
  user 'minecraft'
  group 'minecraft'
end

template '/etc/init/minecraft.conf' do
  source 'init/minecraft.conf.erb'
  mode 0644
end

template "#{node[:minecraft][:base_dir]}/server/server.properties" do
  source 'server.properties.erb'
  mode 0744
  user 'minecraft'
  group 'minecraft'
end

cookbook_file "#{node[:minecraft][:base_dir]}/server/ops.txt" do
  contents 'fapiko'
  mode 0744
  user 'minecraft'
  group 'minecraft'
end

directory "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins" do
  recursive true
  mode 0755
  owner 'minecraft'
  group 'minecraft'
end

template "#{node[:minecraft][:base_dir]}/server/craftbukkit.yml" do
  source 'craftbukkit.yml.erb'
  mode 0744
  user 'minecraft'
  group 'minecraft'
end

include_recipe "#{@cookbook_name}::plugins_dynmap"
