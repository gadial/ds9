Dir.glob("*/*") do |filename|
    File.rename(filename, filename.split(".")[0])
    # puts filename.split(".")[0]
    # File.read(filename) =~ /name: \"([^\"]+)\"/
    # File.rename(filename,"#{File.basename(filename,".markdown")}-#{$1.gsub(".","").gsub("?","").gsub(" ", "-")}.markdown")
end