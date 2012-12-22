#
# Cookbook Name:: minecraft
# Recipe:: plugins_dynmap
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap.jar" do
  source node[:minecraft][:plugins][:dynmap][:plugin_jar]
  mode 0644
  user 'minecraft'
  group 'minecraft'
end

directory "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap" do
  mode 0755
  owner 'minecraft'
  group 'minecraft'
end

template "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap/configuration.txt" do
  source 'plugins/dynmap/configuration.txt.erb'
  mode 0644
  user 'minecraft'
  group 'minecraft'
end

stud_instance 'minecraft-mapper' do
  source_port 8123
  destination_port 25601
  certificate_domain 'fapiko.com'
  action :enable
end

service 'stud' do
  case node[:platform]
    when 'ubuntu'
      provider Chef::Provider::Service::Upstart
  end
  action :start
end
