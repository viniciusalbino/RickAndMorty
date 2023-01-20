Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
source "https://rubygems.org"
gem "xcpretty"
gem "slather"
gem "fastlane"
gem "xcode-install"
gem "xcov"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
