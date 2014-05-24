class SSHProvisioner < Vagrant.plugin("2", :provisioner)
  class Error < Vagrant::Errors::VagrantError; end

  def provision
    private_key_file = machine.config.sandbox.private_key_path
    public_key_file = private_key_file + ".pub"
    authorized_keys_file = "/home/vagrant/.ssh/authorized_keys"

    unless File.exist?(public_key_file) && File.readable?(public_key_file)
      raise Error, "[sandbox] Skipping SSH key provisioning (#{public_key_file} doesn't exist or isn't readable)"
    end

    public_key = File.read(public_key_file).strip
    unless public_key =~ /\Assh-(rsa|dsa|dss) .*\z/
      raise Error, "[sandbox] Skipping SSH key provisioning (#{public_key_file} does not contain a valid public key)"
    end

    machine.communicate.tap do |comm|
      return if comm.test('grep -q "%s" "%s"' % [ public_key, authorized_keys_file ])
      ui.info "[sandbox] Adding SSH key of host system to VM, replacing original key"
      ui.info "[sandbox] #{public_key_file} -> #{authorized_keys_file}"
      comm.execute('grep -v "vagrant" "%s" > "%s".tmp || true' % [ authorized_keys_file, authorized_keys_file ])
      comm.execute('echo "%s" >> "%s".tmp' % [ public_key, authorized_keys_file ])
      comm.execute('uniq "%s".tmp > "%s"' % [ authorized_keys_file, authorized_keys_file ])
      comm.execute('rm -f "%s".tmp' % authorized_keys_file)
    end
  end

  private
  def ui
    machine.env.ui
  end
end
