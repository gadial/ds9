require 'FileUtils'
Jekyll::Hooks.register :site, :post_write do |post|
    puts "Site write finished!"
    puts "Now in dir #{Dir.pwd}"
    FileUtils.cp_r(Dir.glob('_site/*'), 'docs')
end