require 'spec_helper'

DOCKER_IMAGE_DIRECTORY = File.dirname(File.dirname(__FILE__))

describe 'Dockerfile' do
  include Vtasks::Utils::DockerSharedContext::RunningEntrypointContainer

  describe package('gnupg') do
    it { is_expected.to be_installed }
  end

  describe package('haveged') do
    it { is_expected.to be_installed }
  end

  describe command('gpg --version') do
    its(:stdout) { is_expected.to contain('(GnuPG)') }
    its(:exit_status) { is_expected.to eq 0 }
  end
end
