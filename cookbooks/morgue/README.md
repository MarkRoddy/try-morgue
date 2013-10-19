A chef cookbook for standing up Etsy's Morgue

Description
===========
Use this cookbook to try out Morgue, or to manage your own installation.

Requirements
============
You will need the following cookbooks, and most likely a Ubuntu/Debian flavored 
OS. The recipes attempt to be as generic as possible but there are a few 
Ubuntu-isms that leaked through.  
* mysql
* apache2
* openssl
* php
* apt

Attributes
==========
* `node["morgue"]["git_checkout_directory"]` = Where to drop source files
* `node["morgue"]["git_repo"]` = Repo containing Morgue source
* `node["morgue"]["git_ref"]` = What branch to pull down

* `node['morgue']['database_host']`
* `node['morgue']['database_port']`
* `node['morgue']['database']`
* `node['morgue']['dbuser']`
* `node['morgue']['dbpasswd']`


