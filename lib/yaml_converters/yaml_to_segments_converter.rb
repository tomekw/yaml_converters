require "psych"

module YamlConverters
  class YamlToSegmentsConverter
    def initialize(yaml_reader, segment_writer = YamlConverters::SegmentToHashWriter.new)
      @yaml_reader    = yaml_reader
      @segment_writer = segment_writer
    end

    def convert
      flatten_hash(raw_yaml_hash)

      @segment_writer.result
    end

    private

    def file_contents
      @file_contents ||= @yaml_reader.read
    end

    def raw_yaml_hash
      @raw_yaml_hash ||= Psych.load(file_contents)
    end

    def flatten_hash(hash, prefix = nil, result = {})
      hash.each do |key, value|
        current_prefix = prefix ? "#{prefix}#{YamlConverters::SEGMENT_KEY_DELIMITER}#{key}" : String(key)

        if !value.is_a?(Hash)
          result[current_prefix] = value
          @segment_writer.write(current_prefix, value)
        else
          flatten_hash(value, current_prefix, result)
        end
      end

      result
    end
  end
end
