require 'spec_helper'

describe YamlConverters::YamlFileReader do
  subject { described_class.new(file_path) }
  let(:file_path) { 'spec/fixtures/one_key_value_pair.yml' }
  let(:expected_yaml_string) { "---\nparent:\n  child: value\n" }

  before do
    File.stub(:read).with(file_path).and_return(expected_yaml_string)
  end

  its(:read) { should eq(expected_yaml_string) }
end
