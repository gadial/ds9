require 'FileUtils'
Jekyll::Hooks.register :site, :post_write do |post|
    FileUtils.cp_r(Dir.glob('_site/*'), 'docs')
end