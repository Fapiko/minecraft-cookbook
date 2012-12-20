#
# Cookbook Name:: minecraft
# Recipe:: application
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:minecraft][:base_dir]}/application" do
  recursive true
  mode 0755
end

remote_file "#{node[:minecraft][:base_dir]}/application/minecraft.jar" do
  source 'https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar'
  mode 0644
  action :create_if_missing
end

cookbook_file "#{node[:minecraft][:base_dir]}/application/icon.png" do
  mode 0644
  action :create_if_missing
end

template '/etc/skel/minecraft.desktop' do
  source 'minecraft.desktop.erb'
  mode 0644
end

template "#{node[:minecraft][:base_dir]}/application/minecraft.sh" do
  source 'minecraft.sh.erb'
  mode 0755
end

node[:etc][:passwd].each do |user, data|

  if data['uid'] >= 1000 && data['dir'] != '/nonexistent'

    directory "#{data['dir']}/.local/share/applications" do
      owner user
      group user
      mode 0755
      recursive true
    end

    template "#{data['dir']}/.local/share/applications/minecraft.desktop" do
      source 'minecraft.desktop.erb'
      owner user
      group user
      mode 0744
    end

    directory "#{data['dir']}/Desktop" do
      owner user
      group user
      mode 0755
    end

    template "#{data['dir']}/Desktop/minecraft.desktop" do
      source 'minecraft.desktop.erb'
      owner user
      group user
      mode 0744
    end

  end

end
