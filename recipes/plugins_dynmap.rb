package 'unzip'

include_recipe 'stud'

remote_file "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/dynmap.zip" do
  source node[:minecraft][:plugins][:dynmap][:plugin_zip]
  mode 0644
  user 'minecraft'
  group 'minecraft'
  checksum node[:minecraft][:plugins][:dynmap][:plugin_zip_checksum]
end

bash 'unzip-dynmap' do
  user 'minecraft'
  cwd "#{node[:minecraft][:base_dir]}/server/craftbukkit_plugins/"
  code <<-EOH
  unzip dynmap.zip
  rm dynmap.zip
  EOH
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

if !Chef::Config.solo
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
end
