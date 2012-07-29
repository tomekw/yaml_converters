require 'spec_helper'

describe YamlConverters::YamlToSegmentsConverter do
  subject { described_class.new(yaml_reader) }
  let(:yaml_reader) { stub(read: file_contents) }

  context 'simple one key-value pair file' do
    let(:file_contents) { "---\nkey: value\n" }

    its(:convert) { should eq({ 'key' => 'value' }) }
  end

  context 'simple two key-value pairs file' do
    let(:file_contents) { "---\nkey1: value1\nkey2: value2\n" }

    its(:convert) { should eq({ 'key1' => 'value1', 'key2' => 'value2' }) }
  end

  context 'nested key-value pair file' do
    let(:file_contents) { "---\nparent:\n  child: value\n" }

    its(:convert) { should eq({ 'parent.child' => 'value' }) }
  end

  context 'deeply ested key-value pairs file' do
    let(:file_contents) do
      "---\ngrandmother:\n  mother:\n    daughter: olga\n    sister: ania\ngrandfather: eugeniusz\n"
    end

    its(:convert) do
      should eq({
        'grandmother.mother.daughter' => 'olga',
        'grandmother.mother.sister' => 'ania',
        'grandfather' => 'eugeniusz'
      })
    end
  end
end
