# InSpec test for recipe mongo4_cookbook::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
# describe port(80) do
#   it { should be_listening }
# end

describe port(27017) do
  it { should be_listening }
end

describe package('mongodb-org') do
  it { should be_installed }
  its('version'){should match /4\./}
end

describe service ('mongod') do
  it { should be_enabled }
  it { should be_running }
end
