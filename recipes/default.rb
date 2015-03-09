#
# Cookbook Name:: multimc
# Recipe:: default
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

include_recipe "java"

remote_file ::File.join(Chef::Config[:file_cache_path], node["multimc"]["file_name"]) do
  source node["multimc"]["file_download"]
  action :create_if_missing
end

bash "multimc_install" do
  code <<-EOH
    tar -jxvf #{node["multimc"]["file_name"]} --transform=s/#{node["multimc"]["file_replace"]}/#{node["multimc"]["install_directory"]}/ -C #{node["multimc"]["install_prefix"]}
  EOH

  cwd Chef::Config[:file_cache_path]
  action :run

  not_if do
    ::File.directory? ::File.join(node["multimc"]["install_prefix"], node["multimc"]["install_directory"])
  end
end

link node["multimc"]["install_alias"] do
  to ::File.join(node["multimc"]["install_prefix"], node["multimc"]["install_directory"], "MultiMC")

  only_if do
    node["multimc"]["install_alias"]
  end
end

template node["multimc"]["desktop_file"] do
  source "app.desktop.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["multimc"]
  )

  only_if do
    node["multimc"]["desktop_file"]
  end
end

cookbook_file node["multimc"]["logo_file"] do
  source "multimc.svg"
  owner "root"
  group "root"
  mode 0644

  only_if do
    node["multimc"]["logo_file"]
  end
end
