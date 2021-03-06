#
# Cookbook Name:: squid
# Recipe:: default
#
# Author:: Christian Pearce, xforty technologies <pearcec@xforty.com>
#
# Copyright 2012, xforty technologies
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

package "squid" do
  package_name 'squid'
  action :install
end

package "squid-common" do
  package_name 'squid-common'
  action :install
end

service "squid" do
  action :start
  enabled true
  supports [:start, :restart, :stop]
end

cookbook_file "/etc/profile.d/10_http_proxy.sh" do
  source "10_http_proxy.sh"
  owner 'root'
  group 'root'
  mode "0644"
end
