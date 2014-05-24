class SandboxPlugin < Vagrant.plugin("2")
  name "Sandbox"
  description "Additional setup stuff for sandbox"

  config "sandbox" do
    require_relative "sandbox_config"
    SandboxConfig
  end

  provisioner "ssh" do
    require_relative "provisioner/ssh"
    SSHProvisioner
  end
end
