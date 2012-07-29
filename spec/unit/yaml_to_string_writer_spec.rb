require 'spec_helper'

describe YamlConverters::YamlToStringWriter do
  subject { described_class.new }
  let(:yaml) { "---\nparent:\n  child: value\n" }

  it 'should return the same yaml' do
    expect do
      subject.write(yaml)
    end.to change { subject.result }.from('').to(yaml)
  end
end
