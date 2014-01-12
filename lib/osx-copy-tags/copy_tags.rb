#this class has all the logic to copy tags from one folder to another (files in it)

module CopyTags
	class Copier

		#attr_reader :source_folder, :target_folder

		def initialize(source_folder, target_folder)
			@source_folder = File.expand_path(source_folder)
			@target_folder = File.expand_path(target_folder)
		end

		def copyTags
			if !self.class.checkTagsTool 
				puts "Missing commandline tool 'tag'. Please install using instruction from http://github.com/jdberry/tag"
				return
			end

			if !checkFoldersValidity
				puts "One of the 2 given folders is not a valid directory".red
				return
			end



			puts = "...starting copying tags from #{@source_folder} to #{@target_folder}"

			copy
		end

		def checkFoldersValidity
			if !File.directory?(@source_folder)
				return false
			end
			if !File.directory?(@target_folder)
				return false
			end
			return true
		end

		def copy
			@fileCount = 0
			@errors = 0

			Dir.foreach(@source_folder) do |file|
				next if file.chr == "."
				
				#search matching file in notag folder
				sourceFilePath = @source_folder+"/#{file}"
				targetFilePath = @target_folder+"/#{file}"

				tagString = `tag #{sourceFilePath} --no-name`
				tagString = tagString.delete!("\n")

				if tagString and tagString.include? " "
					tagString[" "] = "\\ "
					puts tagString.yellow
				end
				
				matching = File.exists?(targetFilePath)


				# #if file is found
				if matching
					puts "file #{sourceFilePath} matched at target directory".green
					@fileCount = @fileCount+1

					execString = "tag -s #{tagString} #{targetFilePath}"
					puts execString
					puts
					done = system(execString)

					if !done
						puts "Could not transfer tags for file: #{file}".red
						@errors = @errors+1
					end
				end
			end

			puts
			puts "+++ #{@fileCount} files matched criterium".green
			puts "+++ #{@errors} errors".red

		end

		def self.checkTagsTool
			system('tag')
		end
	end
end