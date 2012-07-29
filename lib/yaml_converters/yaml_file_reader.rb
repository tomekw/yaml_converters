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
