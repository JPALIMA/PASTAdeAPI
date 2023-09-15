ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
require 'bootsnap/setup'  # Deixe essa linha aqui

# Adicione as linhas abaixo
if defined?(Bootsnap)
  Bootsnap.setup(cache_dir: 'tmp/cache', development: true, load_path_cache: false)
end

