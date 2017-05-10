#
# Cookbook:: smb-windows
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Remove SMB1 Server functions for Server 2012 and newer
windows_feature "FS-SMB1" do
  action :remove
  install_method :windows_feature_dism
end

# Disable SMB1 server
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' do
  values [{
    name: 'SMB1',
    type: :dword,
    data: 0
  }]
  action :create
end
