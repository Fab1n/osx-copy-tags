#entrence point for command line tool

require 'osx-copy-tags/copy_tags'
require 'colored'

module CopyTags
	class Command
		def initialize(argv)
			puts argv
		end

		def self.run(argv)
			copier = CopyTags::Copier.new(argv[0],argv[1])
			copier.copyTags
		end
	end
end