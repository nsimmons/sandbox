ruby_src_path = "/var/ruby-src"
ruby_install_path = "/opt/ruby"

default['ruby-install'][:git_url] = "https://github.com/postmodern/ruby-install.git"
default['ruby-install'][:git_ref] = "v0.4.3"
default['ruby-install'][:install_path] = "/opt/ruby-install"
default['ruby-install'][:rubies] = [
    {
      ruby: "ruby 2.1.2",
      "src-dir" => ruby_src_path,
      "install-dir" => ruby_install_path,
      reinstall: false,
      gems: [
        { name: "bundler", version: "1.5.1" }
      ]
    }
  ]

default[:ruby_src_path] = ruby_src_path
default[:ruby_install_path] = ruby_install_path
