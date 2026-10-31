require "open-uri"

downloads_url = "https://www.betterbird.eu/downloads/"
version_pattern = /Current version:\s*Betterbird\s+\d+(?:\.\d+)+\s+ESR\s+\((\d+(?:\.\d+)+esr-bb\d+),/i
page = URI.open(downloads_url, open_timeout: 15, read_timeout: 30, &:read)
version = page[version_pattern, 1]
abort "Could not find Betterbird's current release version at #{downloads_url}" unless version

cask_path = File.expand_path("../Casks/betterbird.rb", __dir__)
cask = File.read(cask_path)
version_line = /^  version "[^"]+"$/
abort "Expected exactly one cask version line in #{cask_path}" unless cask.scan(version_line).one?

updated_cask = cask.sub(version_line, %(  version "#{version}"))
if updated_cask == cask
  puts "Betterbird cask is already current (#{version})."
else
  File.write(cask_path, updated_cask)
  puts "Updated Betterbird cask to #{version}."
end
