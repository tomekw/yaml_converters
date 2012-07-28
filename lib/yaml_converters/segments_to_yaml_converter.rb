class SegmentsToYamlConverter
  def initialize(segments)
    @segments = segments
  end

  def convert
    Psych.dump(@segments)
  end
end
