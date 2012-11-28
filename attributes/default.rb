#
# Cookbook Name:: cloudfoundry-router
# Attributes:: default
#
# Copyright 2012, ZephirWorks
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

include_attribute "cloudfoundry"

# Where to install the CloudFoundry code.
default['cloudfoundry_router']['vcap']['install_path'] = "/srv/vcap-router"

# Repository to use when fetching the CloudFoundry code.
default['cloudfoundry_router']['vcap']['repo']         = "https://github.com/cloudfoundry/router.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_router']['vcap']['reference']    = "346867cfa72a7d0e9d8f80fa4cfa95261834c260"

default['cloudfoundry_router']['ruby_version'] = node['cloudfoundry']['ruby_1_9_2_version']

# IP address of the interface to bind to; i.e. the nginx vhost.
default['cloudfoundry_router']['listen_ip'] = "0.0.0.0"

# IP address of the interface to bind to; i.e. the nginx vhost.
default['cloudfoundry_router']['listen_port'] = "80"

# Unix socket for the connection between the router and nginx.
default['cloudfoundry_router']['socket_file'] = "/tmp/router.sock"

# Where to write the Router's access log.
default['cloudfoundry_router']['access_log'] = File.join(node['cloudfoundry']['log_dir'], "vcap.access.log")

# Log level for the router.
default['cloudfoundry_router']['log_level'] = "info"

# Where to write the Router's logs. XXX (trotter): I'm not certain this
# attribute actually works.
default['cloudfoundry_router']['log_file'] = File.join(node['cloudfoundry']['log_dir'], "router.log")

# Where to write the Router's pid.
default['cloudfoundry_router']['pid_file'] = File.join(node['cloudfoundry']['pid_dir'], "router.pid")

# The biggest application we'll accept.
default['cloudfoundry_router']['client_max_body_size'] = "256M"

default['cloudfoundry_router']['session_key']    = "14fbc303b76bacd1e0a3ab641c11d11400341c5d"

default['cloudfoundry_router']['trace_key']    = "222"

default['cloudfoundry_router']['uls_ip'] = "localhost"
default['cloudfoundry_router']['uls_port'] = 8081
default['cloudfoundry_router']['status_user'] = "admin"
default['cloudfoundry_router']['status_passwd'] = "password"
