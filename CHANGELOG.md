# CHANGELOG

## Version 0.2 (unreleased)

* Allow to read YAML file contents from a different source (file, AWS)

## Version 0.1 (2012-07-29)

* Add CHANGELOG
* Change API of `segment_writer` - provide key and value explicitly,
  instead of a hash
* Bump Psych dependency to `>= 1.3.3`

## Version 0.0.1 (2012-07-28)

* Initial implementation of `YamlConverters::YamlToSegmentsConverter`
* Initial implementation of `YamlConverters::SegmentsToYamlConverter`
* Example implementation of `segment_writer`
* Example implementation of `yaml_writer`
