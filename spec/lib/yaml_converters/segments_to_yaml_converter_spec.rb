require 'spec_helper'

describe YamlConverters::SegmentsToYamlConverter do
  subject { described_class.new(segments) }

  context 'simple one key-value pair segment' do
    let(:segments) { { 'key' => 'value' } }

    its(:convert) { should eq("---\nkey: value\n") }
  end

  context 'simple two key-value pairs segments' do
    let(:segments) { { 'key1' => 'value1', 'key2' => 'value2' } }

    its(:convert) { should eq("---\nkey1: value1\nkey2: value2\n") }
  end

  context 'nested key-value pair segments' do
    let(:segments) { { 'parent.child' => 'value' } }

    its(:convert) { should eq("---\nparent:\n  child: value\n") }
  end

  context 'deeply nested key-value pairs segments' do
    let(:segments) do
      {
        'grandmother.mother.daughter' => 'olga',
        'grandmother.mother.sister' => 'ania',
        'grandfather' => 'eugeniusz'
      }
    end

    its(:convert) { should eq(
      "---\ngrandmother:\n  mother:\n    daughter: olga\n    sister: ania\ngrandfather: eugeniusz\n"
    ) }
  end
end
