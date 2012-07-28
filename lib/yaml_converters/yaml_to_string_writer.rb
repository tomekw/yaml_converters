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
