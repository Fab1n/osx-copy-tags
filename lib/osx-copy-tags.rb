#entrence point for command line tool

require 'osx-copy-tags/copy_tags'

module CopyTags
	class Command
		def initialize(argv)
			puts argv
		end

		def self.run
			puts 'program started'

			Copier.new('~/Documents','~/Dropbox').copy_tags
		end
	end
end