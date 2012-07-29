# YamlConverters  [![Build Status](https://secure.travis-ci.org/tomekw/yaml_converters.png)](http://travis-ci.org/tomekw/yaml_converters)

Convert YAML to segments and back.

## Installation

Add this line to your application's Gemfile:

    gem 'yaml_converters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaml_converters

Supported Ruby versions:

* `1.9.3`
* `1.9.2`

## Usage

### Converting YAML into segments

Use `YamlConverters::YamlToSegmentsConverter#convert` to split YAML file
into flat key-value pairs.

``` ruby
yaml_reader = YamlConverters::YamlFileReader.new('path/to/file.yml')
converter = YamlConverters::YamlToSegmentsConverter.new(
  yaml_reader, YamlConverters::SegmentToHashWriter.new
)
converter.convert # => { 'key' => 'value', ... }
```

You can pass custom `segment_writer` to dump generated segments
somewhere (database, for example). Custom writer should respond to
two public methods:

* `write(key, value)` - performs actual key-value pair dumping
* `result` - returns whatever you want from `convert`

Default `segment_writer` is an instance of
`YamlConverters::SegmentToHashWriter` that returns a `Hash`.

``` ruby
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
```

You can pass custom `yaml_reader` to read YAML file from
a different source (AWS, for example). Custom reader should respond to
one public method:

* `read` - returns string containing YAML file contents

Example `yaml_reader`:

``` ruby
module YamlConverters
  class YamlFileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def read
      File.read(@file_path)
    end
  end
end
```

### Converting segments into YAML

Use `YamlConverters::SegmentsToYamlConverter#convert` to dump segments
(key-value pairs) to YAML file.

``` ruby
converter = YamlConverters::SegmentsToYamlConverter(
  { 'key' => 'value' }, YamlConverters::YamlToStringWriter.new
)
converter.convert # => "---\nkey: value\n"
```

You can pass custom `yaml_writer` to dump generated YAML file
somewhere (file, for example). Custom writer should respond to
two public methods:

* `write(yaml_string)` - performs actual YAML string dumping
* `result` - returns whatever you want from `convert`

Default `yaml_writer` is an instance of
`YamlConverters::YamlToStringWriter` that returns a `String`.

``` ruby
module YamlConverters
  class YamlToStringWriter
    attr_reader :result

    def initialize
      @result = ''
    end

    def write(yaml)
      @result = yaml
    end
  end
end
```

## Acknowledgements

Implementation of flattening a YAML file and generating a YAML file
from key-value pairs taken (I hope, for now) from Tolk codebase.

## Warning

Until version `1.0.0` is reached API may be changed without any notice!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
