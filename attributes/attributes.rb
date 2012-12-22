default[:minecraft][:deployment] = 'application'
default[:minecraft][:base_dir] = '/opt/minecraft'
default[:minecraft][:craftbukkit][:server_jar] = 'https://dl.dropbox.com/u/50768347/craftbukkit-1.4.6-R0.1.jar'
default[:minecraft][:plugins][:dynmap][:plugin_jar] = 'https://dl.dropbox.com/u/50768347/dynmap.jar'

default[:minecraft][:servers][0][:name] = "Lucas's Server"
default[:minecraft][:servers][0][:parse_name] = 'lucas_server'
default[:minecraft][:servers][0][:port] = 3000
default[:minecraft][:servers][0][:memory] = '1024M'