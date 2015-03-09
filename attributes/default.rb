#
# Cookbook Name:: multimc
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["multimc"]["file_name"] = "mmc-stable-lin64.tar.gz"
default["multimc"]["file_download"] = "http://files.multimc.org/downloads/#{node["multimc"]["file_name"]}"
default["multimc"]["file_replace"] = "MultiMC"
default["multimc"]["install_directory"] = "multimc"
default["multimc"]["install_prefix"] = "/opt"
default["multimc"]["install_alias"] = "/usr/local/bin/multimc"
default["multimc"]["desktop_file"] = "/usr/share/applications/multimc.desktop"
default["multimc"]["logo_file"] = "/usr/share/icons/hicolor/scalable/apps/multimc.svg"
