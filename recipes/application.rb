#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node[:minecraft][:base_dir]}/application/minecraft.jar" do
  source 'https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar'
  mode 0644
  action :create_if_missing
end

cookbook_file "#{node[:minecraft][:base_dir]}/application/minecraft_icon.png" do
  mode 0644
  action :create_if_missing
end

template '/etc/skel/minecraft.desktop' do
  source 'minecraft.desktop.erb'
  mode 0644
end

node[:etc][:passwd].each do |user, data|
  Chef::Log.warn data
end
