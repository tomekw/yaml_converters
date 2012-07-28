require 'active_support/core_ext/hash'

require 'yaml_converters/version'
require 'yaml_converters/yaml_to_segments_converter'
require 'yaml_converters/segments_to_yaml_converter'
require 'yaml_converters/segment_to_hash_writer'

module YamlConverters
  SEGMENT_KEY_DELIMITER = '.'
end
