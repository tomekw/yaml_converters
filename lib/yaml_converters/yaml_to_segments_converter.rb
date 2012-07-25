module YamlConverters
  class YamlToSegmentsConverter
    def initialize(file_path)
      @file_path = file_path
    end

    def convert
      yaml_hash
    end

    private

    def file_contents
      @file_contents ||= File.read(@file_path)
    end

    def yaml_hash
      Psych.load(file_contents)
    end
  end
end
