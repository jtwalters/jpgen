###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

activate :target do |t|
  t.build_targets = {}
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def defaults_json
    defaults = Hash.new
    data.options.each do |k, v|
      defaults[k] = v[:default]
    end
    defaults.to_json
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :strip_index_file, false if target? :chrome
set :relative_links, true

# Build-specific configuration
configure :build do
  activate :livereload

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # ignore these patterns for all builds
  ignore /sjcl\/(?!sjcl\.js)/
  ignore /psd\/.*/

  # ignore for specific builds
  if target? :chrome
    ignore 'javascripts/google-analytics-tracking.js'
    ignore 'javascripts/random-test.js'
    ignore 'javascripts/pnglib.js'
    ignore 'random-test.html.haml'
  end
end