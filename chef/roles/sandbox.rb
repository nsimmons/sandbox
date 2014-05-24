name "sandbox"
description "Role for my sandbox"

run_list "recipe[sandbox]", "recipe[sandbox::install-ruby]", "recipe[sandbox::mysql]"
