# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

describe windows_feature('FS-SMB1') do
  it { should_not be_installed }
end

# Disable SMB1 Server functionality
describe registry_key('SMB1','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters') do
  its('SMB1') { should eq 0 }
end