# frozen_string_literal: true

module WahWah
  class Tag
    attr_reader(
      :title,
      :artist,
      :album,
      :track,
      :duration,
      :birtate,
      :file_size,
      :genre,
      :year,
      :cover
    )

    def initialize(file_path)
      @file_size = File.size(file_path)
      parse(File.open(file_path)) if @file_size > 0
    end

    def parse
      raise WahWahNotImplementedError, 'The parse method is not implemented'
    end
  end
end

# Require others tag format class from tag directory.
Dir.glob(File.dirname(__FILE__) + '/tag/*.rb').each do |path|
  filename = File.basename(path)
  require "wahwah/tag/#{filename}"
end