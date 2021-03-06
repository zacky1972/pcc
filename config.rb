require 'slim'
set :slim, { :pretty => true, :sort_attrs => false, :format => :html }

require "uglifier"

###
# Page options, layouts, aliases and proxies
###

# Sprockets
activate :sprockets

after_configuration do
    sprockets.append_path File.join( root, "bower_components/" )
end

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
   # activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
configure :build do
end

activate :minify_html, :remove_quotes => false, :remove_intertag_spaces => true

# Minify CSS on build
activate :minify_css

# Minify Javascript on build
activate :minify_javascript,
    compressor: proc {
        ::Uglifier.new(:mangle => {:toplevel => true}, :compress => {:unsafe => true}, :output => {:comments => :none})
    }

activate :gzip
