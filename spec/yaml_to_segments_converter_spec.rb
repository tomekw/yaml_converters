require 'spec_helper'

describe YamlConverters::YamlToSegmentsConverter do
  subject { described_class.new }

  its(:convert) { should eq true }
end
