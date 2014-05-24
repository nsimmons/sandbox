class SandboxConfig < Vagrant.plugin(2, :config)
  attr_accessor :private_key_path

  def initialize
    @private_key_path = nil
  end
end
