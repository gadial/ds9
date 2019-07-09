Dir.glob("S0[4-7]E*.markdown") do |filename|
    File.read(filename) =~ /name: \"([^\"]+)\"/
    File.rename(filename,"#{File.basename(filename,".markdown")}-#{$1.gsub(".","").gsub("?","").gsub(" ", "-")}.markdown")
end