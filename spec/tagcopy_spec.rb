require 'osx-copy-tags'

describe CopyTags::Copier do
	it "path is /Users/rennerfabian/Documents and Dropbox equiv" do
		CopyTags::Copier.new('~/Documents','~/Dropbox').copyTags.should eql("... starting copying tags from /Users/rennerfabian/Documents to /Users/rennerfabian/Dropbox")
	end
end

describe CopyTags::Copier do
	it "check if tag commandline tool exists" do
		CopyTags::Copier.checkTagsTool.should eql(true)
	end
end