module YamlConverters
  class SegmentsToYamlConverter
    def initialize(segments)
      @segments = segments
    end

    def convert
      Psych.dump(raw_yaml_hash)
    end

    private

    def raw_yaml_hash
      @raw_yaml_hash ||= @segments.each_with_object({}) do |(key, value), raw_yaml_hash|
        if key.include?('.')
          raw_yaml_hash.deep_merge!(unsquish(key, value))
        else
          raw_yaml_hash[key] = value
        end
      end
    end

    def unsquish(string, value)
      if string.is_a?(String)
        unsquish(string.split('.'), value)
      elsif string.size == 1
        { string.first => value }
      else
        key  = string[0]
        rest = string[1..-1]
        { key => unsquish(rest, value) }
      end
    end
  end
end
