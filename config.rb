# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true
# Multi site
#site_prefix = ENV["SITE"] || "source"
#unless site_prefix.nil?
#    set :source, "#{site_prefix}"
#end

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

activate :sprockets
# Activate the syntax highlighter
activate :syntax

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Activate s3 sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = ENV['BUCKET'] # The name of the S3 bucket you are targeting. This is globally unique.
  s3_sync.region                     = ENV['REGION']     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY']
  s3_sync.aws_secret_access_key      = ENV['AWS_ACCESS_SECRET']
  #s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = true # We do not chain after the build step by default.
  #s3_sync.prefer_gzip                = true
  #s3_sync.path_style                 = true
  #s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  #s3_sync.encryption                 = false
  #s3_sync.prefix                     = ''
  #s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
  #s3_sync.error_document             = '404.html'
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true
#activate :asset_hash

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567
