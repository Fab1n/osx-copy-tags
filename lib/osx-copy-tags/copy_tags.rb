#this class has all the logic to copy tags from one folder to another (files in it)

module CopyTags
	class Copier

		#attr_reader :source_folder, :target_folder

		def initialize(source_folder, target_folder)
			@source_folder = File.expand_path(source_folder)
			@target_folder = File.expand_path(target_folder)
		end

		def copyTags
			if !self.class.checkTagsTool return "Missing tool 'tag'. Please install usinng instruction from http://github.com/jdberry/tag"

			returnValue = "... starting copying tags from #{@source_folder} to #{@target_folder}"
			
			puts returnValue

			returnValue
		end

		def self.checkTagsTool
			system('tag')
		end
	end
end

# noTagPath = '/Users/rennerfabian/Desktop/noTag'
# tagPath = '/Users/rennerfabian/Dropbox/noocr'

# @fileCount = 0

# Dir.foreach(tagPath) do |file|
# 	next if file == '.' or file == '..' or !file.include? '.pdf'
# 	tagString = `tag #{file} --no-name`

# 	#search matching file in notag folder
# 	concatPath = tagPath+"/#{file}"
	
# 	matching = File.exists?(concatPath)

# 	#if file is found
# 	if matching
# 		puts "file |#{concatPath}| exists at target directory"
# 		fileCount++
# 		#`tag -a #{concatPath} #{tagString}`
# 	end

# 	puts
# 	puts "+++ #{fileCount} files matched criterium"
# end
