require 'spec_helper'

describe YamlConverters::SegmentToHashWriter do
  subject     { described_class.new }
  let(:key)   { 'key' }
  let(:value) { 'value' }

  it 'should return the same hash' do
    expect do
      subject.write(key, value)
    end.to change { subject.result }.from({}).to({ key => value })
  end
end
