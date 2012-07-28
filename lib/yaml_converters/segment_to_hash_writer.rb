module YamlConverters
  class SegmentToHashWriter
    attr_reader :result

    def initialize
      @result = {}
    end

    def write(hash)
      @result.deep_merge!(hash)
    end
  end
end
