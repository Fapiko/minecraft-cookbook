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

directory "/var/log/minecraft" do
  recursive true
  mode 0755
  owner 'root'
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
  source 'https://dl.dropbox.com/u/50768347/craftbukkit-1.4.5-R1.0.jar'
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
  mode 0644
  user 'minecraft'
  group 'minecraft'
end

file "#{node[:minecraft][:base_dir]}/server/ops.txt" do
  content 'fapiko'
  mode 0644
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
  mode 0644
  user 'minecraft'
  group 'minecraft'
end

directory "#{node[:minecraft][:base_dir]}/server/ramdisk" do
  recursive true
  mode 0755
  owner 'minecraft'
  group 'minecraft'
end

mount "#{node[:minecraft][:base_dir]}/server/ramdisk" do
  fstype 'tmpfs'
  device 'ramdisk'
  options ['mode=0755', 'size=6g']
  action [:mount, :enable]
end

directory "#{node[:minecraft][:base_dir]}/server/ramdisk_backups" do
  recursive true
  mode 0755
  owner 'root'
  group 'root'
end

cron 'backup_minecraft_ramdisk' do
  minute '*/3'
  user 'root'
  command "rsync -a #{node[:minecraft][:base_dir]}/server/ramdisk #{node[:minecraft][:base_dir]}/server/ramdisk_backups"
end

include_recipe "#{@cookbook_name}::plugins_dynmap"
