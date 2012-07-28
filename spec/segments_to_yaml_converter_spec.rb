require 'spec_helper'

describe SegmentsToYamlConverter do
  subject { described_class.new(segments) }

  context 'simple one key-value pair segment' do
    let(:segments) { { 'key' => 'value' } }

    its(:convert) { should eq(File.read('spec/fixtures/one_key_value_pair.yml')) }
  end

  context 'simple two key-value pairs segments' do
    let(:segments) { { 'key1' => 'value1', 'key2' => 'value2' } }

    its(:convert) { should eq(File.read('spec/fixtures/two_key_value_pairs.yml')) }
  end
end
