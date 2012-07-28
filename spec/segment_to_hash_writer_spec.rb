require 'spec_helper'

describe YamlConverters::SegmentToHashWriter do
  subject { described_class.new }
  let(:hash) { { 'key' => 'value' } }

  it 'should return the same hash' do
    expect do
      subject.write(hash)
    end.to change { subject.result }.from({}).to(hash)
  end
end
