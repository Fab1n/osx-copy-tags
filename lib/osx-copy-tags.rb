#entrence point for command line tool

require 'osx-copy-tags/copy_tags'
require 'colored'

module CopyTags
	class Command
		def initialize(argv)
			puts argv
		end

		def self.run(argv)
			puts 'program started'

			copier = CopyTags::Copier.new('~/Documents','~/Dropbox')
			copier.copyTags
		end
	end
end