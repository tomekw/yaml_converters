require 'spec_helper'

describe YamlConverters::YamlToSegmentsConverter do
  subject { described_class.new(file_path) }

  context 'simple one key-value pair file' do
    let(:file_path) { 'spec/fixtures/one_key_value_pair.yml' }

    its(:convert) { should eq({ 'key' => 'value' }) }
  end
end
