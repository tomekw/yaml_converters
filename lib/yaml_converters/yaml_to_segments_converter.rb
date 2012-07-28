module YamlConverters
  class YamlToSegmentsConverter
    def initialize(file_path)
      @file_path = file_path
    end

    def convert
      @intermediate_flat_hash ||= flatten_hash(raw_yaml_hash)
    end

    private

    def file_contents
      @file_contents ||= File.read(@file_path)
    end

    def raw_yaml_hash
      @raw_yaml_hash ||= Psych.load(file_contents)
    end

    def flatten_hash(hash, prefix = nil, result = {})
      hash.each do |key, value|
        current_prefix = prefix ? "#{prefix}#{YamlConverters::SEGMENT_KEY_DELIMITER}#{key}" : String(key)

        if !value.is_a?(Hash)
          result[current_prefix] = value
        else
          flatten_hash(value, current_prefix, result)
        end
      end

      result
    end
  end
end
