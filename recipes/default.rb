#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright (C) 2012 Lucas Jandrew
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'

case node[:minecraft][:deployment]
  when 'both'
    include_recipe "#{@cookbook_name}::application"
    include_recipe "#{@cookbook_name}::server"
  when 'application'
    include_recipe "#{@cookbook_name}::application"
  when 'server'
    include_recipe "#{@cookbook_name}::server"
  else
    Chef::Log.error 'Unknown deployment method supplied'
end
