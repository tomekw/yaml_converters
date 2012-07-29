require 'spec_helper'

describe 'YAML to segments conversion' do
  subject           { YamlConverters::YamlToSegmentsConverter.new(yaml_reader) }
  let(:yaml_reader) { YamlConverters::YamlFileReader.new(file_path) }
  let(:file_path)   { 'spec/fixtures/deeply_nested_key_value_pairs.yml' }

  its(:convert) do
    should eq({
      'grandmother.mother.daughter' => 'olga',
      'grandmother.mother.sister' => 'ania',
      'grandfather' => 'eugeniusz'
    })
  end
end
