require 'spec_helper'

describe 'ruby::1_8_7_p358' do
  context 'under os x 10.8' do
    let(:facts) do
      {
        :boxen_home                  => '/opt/boxen',
        :macosx_productversion_major => '10.8'
      }
    end

    it do
      should include_class('gcc')

      should contain_ruby__version('1.8.7-p358').with_env({
        'CC'             => '/opt/boxen/homebrew/bin/gcc-4.2',
        'CONFIGURE_OPTS' => '--disable-tk --disable-tcl --disable-tcltk-framework'
      })
    end
  end

  context 'under os x not 10.8' do
    let(:facts) do
      {
        :boxen_home                  => '/opt/boxen',
        :macosx_productversion_major => '10.9'
      }
    end

    it do
      should contain_ruby__version('1.8.7-p358').with_env({
        'CC' => '/opt/boxen/homebrew/bin/gcc-4.2',
      })
    end
  end
end
