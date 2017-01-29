require 'spec_helper'

describe 'mas' do
  let(:facts) { default_test_facts }

  it do
    should contain_class('homebrew')
    should contain_package('mas')
    should contain_exec('mas account login')
  end
end
