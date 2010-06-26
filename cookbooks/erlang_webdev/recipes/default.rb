#
# Cookbook Name:: erlang_webdev
# Recipe:: defaults
#
# Just git clones and places in /vagrant the rebar script and in /hom/vagrant/.template the templates
#
# Author:: Russell Brown (russell@ossme.net>)
# Copyright 2009, ossme.net
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


templates_version = node[:templates][:version]

git "/home/vagrant/rebar_templates" do
  destination "/home/vagrant/rebar_templates"
  repository "git://github.com/russelldb/rebar_templates.git"
  reference #{templates_version}
  action :checkout
  user "vagrant"
  group "vagrant"
end

bash "start nginx" do
  code <<-EOH
    sudo /usr/local/nginx/sbin/nginx
  EOH
end

bash "move_stuff_about" do
  cwd "/home/vagrant"
  code <<-EOH
    sudo vagrant
    cp -r rebar_templates/templates /vagrant/.templates
    cp rebar_templates/rebar /vagrant/rebar
  EOH
end
