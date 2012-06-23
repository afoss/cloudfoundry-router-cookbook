include_attribute "cloudfoundry"

# Where to install the CloudFoundry code.
default['cloudfoundry_router']['vcap']['install_path'] = "/srv/vcap-router"

# Repository to use when fetching the CloudFoundry code.
default['cloudfoundry_router']['vcap']['repo']         = "https://github.com/cloudfoundry/router.git"

# Git reference to use when fetching the CloudFoundry code. Can be
# either a specific sha or a reference such as `HEAD` or `master`.
default['cloudfoundry_router']['vcap']['reference']    = "8a3d41b5dc06a472d27f7cabe6f61c668075ac47"

# IP address of the interface to bind to; i.e. the nginx vhost.
default['cloudfoundry_router']['listen_ip'] = "0.0.0.0"

# IP address of the interface to bind to; i.e. the nginx vhost.
default['cloudfoundry_router']['listen_port'] = "80"

# Unix socket for the connection between the router and nginx.
default[:cloudfoundry_router][:socket_file] = "/tmp/router.sock"

# Where to write the Router's access log.
default[:cloudfoundry_router][:access_log] = File.join(node['cloudfoundry']['log_dir'], "vcap.access.log")

# Log level for the router.
default[:cloudfoundry_router][:log_level] = "info"

# Where to write the Router's logs. XXX (trotter): I'm not certain this
# attribute actually works.
default[:cloudfoundry_router][:log_file] = File.join(node['cloudfoundry']['log_dir'], "router.log")

# Where to write the Router's pid.
default[:cloudfoundry_router][:pid_file] = File.join(node['cloudfoundry']['pid_dir'], "router.pid")

# The biggest application we'll accept.
default[:cloudfoundry_router][:client_max_body_size] = "256M"

default[:cloudfoundry_router][:session_key]    = "14fbc303b76bacd1e0a3ab641c11d11400341c5d"

default[:cloudfoundry_router][:trace_key]    = "222"

default[:cloudfoundry_router][:uls_ip] = "localhost"
default[:cloudfoundry_router][:uls_port] = 8081
default[:cloudfoundry_router][:status_user] = "admin"
default[:cloudfoundry_router][:status_passwd] = "password"
