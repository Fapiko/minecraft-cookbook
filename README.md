# Minecraft cookbook

# Requirements
This has only been tested on Ubuntu.

# Usage

# Attributes
* :minecraft
    * :base_dir - Determines where both the client and server will be installed
        * Default: _/opt/minecraft_
    * :deployment - Determines what to deploy. Options are _server_, _application_, or _both_. Choosing server will setup a minecraft server while application will download the client jar and add a desktop icon.
            * Default: _application_
    * :craftbukkit
        * :server_jar - Url to download craftbukkit from. Update this if you want to upgrade the server
        * :server_jar_checksum - Sha 256 hash of the server jar. If this checksum doesn't match the jar Chef will redownload it on every run
    * :plugins
        * :dynmap - Outputs a map which updates player positions and renders the map in near real time
            * :plugin_zip - Url to download the dynmap plugin from. Update this if you want to upgrade the plugin version
            * :plugin_zip_checksup - Sha 256 hash of the plugin download. If this checksum doesn't match the file specified in :plugin_zip Chef will redownload it on every run
    * :server
        * :heap_min_ram - Amount of RAM to allocate to the JVM at startup
            * Default: _4G_
        * :heap_max_ram - Maximum amount of RAM the JVM should use
            * Default: _8G_

# Recipes

# Author

Author:: Lucas Jandrew (<lucas@jandrew.com>)
