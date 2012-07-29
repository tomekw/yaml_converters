module YamlConverters
  class SegmentToHashWriter
    attr_reader :result

    def initialize
      @result = {}
    end

    def write(key, value)
      @result.deep_merge!({ key => value })
    end
  end
end
