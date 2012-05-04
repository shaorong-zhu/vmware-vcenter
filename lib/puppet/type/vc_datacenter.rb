Puppet::Type.newtype(:vc_datacenter) do
  @doc = "Manage vCenter datacenters."

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    defaultto(:present)
  end

  newparam(:path) do
    desc "The path to the datacenter."
    isnamevar
  end

  newparam(:connection) do
    desc "The connectivity to vCenter."
    # username:password@hostname
  end

  autorequire(:vc_folder) do
    # autorequrie parent folder.
  end
end
