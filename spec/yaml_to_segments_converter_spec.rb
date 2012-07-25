require 'spec_helper'

describe YamlConverters::YamlToSegmentsConverter do
  subject { described_class.new(file_path) }

  context 'simple one key-value pair file' do
    let(:file_path) { 'spec/fixtures/one_key_value_pair.yml' }

    its(:convert) { should eq({ 'key' => 'value' }) }
  end

  context 'simple two key-value pairs file' do
    let(:file_path) { 'spec/fixtures/two_key_value_pairs.yml' }

    its(:convert) { should eq({ 'key1' => 'value1', 'key2' => 'value2' }) }
  end
end
