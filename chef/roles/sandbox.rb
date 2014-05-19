name "sandbox"
description "Role for my sandbox"

run_list "recipe[ruby-install]", "recipe[ruby-install::install]"

default_attributes({
  "ruby-install" => {
    git_url: "https://github.com/postmodern/ruby-install.git",
    git_ref: "v0.4.3",
    rubies: [
      {
        ruby: "ruby 2.1.2",
        user: "vagrant",
        group: "vagrant",
        reinstall: false,
        gems: [
          { name: "bundler", version: "1.5.1" }
        ]
      }
    ]
  }
})
