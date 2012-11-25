#
# Cookbook Name:: cloudfoundry-router
# Recipe:: lua_modules
#
# Copyright 2012, Trotter Cashion
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

lua_package_path = File.join(node['cloudfoundry_router']['vcap']['install_path'], "ext", "nginx")

package "liblua5.1-0-dev"

git "/tmp/lua-cjson" do
  repository "https://github.com/efelix/lua-cjson"
  revision "bc9ca501a5469ebd5fb6019007166524aa592977"
  user node['cloudfoundry']['user']
  action :sync
end

bash "Install lua json" do
  cwd "/tmp/lua-cjson"
  user node['cloudfoundry']['user']
  code <<-EOH
    LUA_INCLUDE_DIR=/usr/include/lua5.1 make
    LUA_LIB_DIR=#{lua_package_path} make install
  EOH
  not_if do
    ::File.exists?(File.join(lua_package_path, "cjson.so"))
  end
end
