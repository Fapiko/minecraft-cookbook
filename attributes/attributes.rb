default[:minecraft][:deployment] = 'application'
default[:minecraft][:base_dir] = '/opt/minecraft'
default[:minecraft][:craftbukkit][:server_jar] = 'https://dl.dropbox.com/u/50768347/craftbukkit-1.4.6-R0.1.jar'
default[:minecraft][:craftbukkit][:server_jar_checksum] = 'b845e55348068069bd8709254e18987bdf6b7a15767e348dc02abc0a0ff35b61'

default[:minecraft][:plugins][:dynmap][:plugin_jar] = 'https://dl.dropbox.com/u/50768347/dynmap.jar'
default[:minecraft][:plugins][:dynmap][:plugin_jar_checksum] = '9991346f3e6837e172550a5e7a9a0c4cf23e1401ea0e849f7eacbe02876d50b4'

default[:minecraft][:plugins][:dynmap][:plugin_zip] = 'http://webbukkit.org/jenkins/public/dynmap/dynmap-HEAD-bin.zip'
default[:minecraft][:plugins][:dynmap][:plugin_zip_checksum] = '4549bbd6d0480afd74dfa4a9347259b17d17dce20bbab389a917d26ad37c822d'


default[:minecraft][:servers][0][:name] = "Lucas's Server"
default[:minecraft][:servers][0][:parse_name] = 'lucas_server'
default[:minecraft][:servers][0][:port] = 3000
default[:minecraft][:servers][0][:memory] = '1024M'