cask "betterbird" do
  version "153.7.0esr-bb13"
  sha256 :no_check

  url "https://www.betterbird.eu/downloads/get.php?os=mac-arm64&lang=en-US&version=release"
  name "Betterbird"
  desc "Fine-tuned version of Mozilla Thunderbird"
  homepage "https://www.betterbird.eu/"

  livecheck do
    url "https://www.betterbird.eu/downloads/"
    regex(/Current version: Betterbird \d+(?:\.\d+)+ ESR \((\d+(?:\.\d+)+esr-bb\d+)/i)
  end

  conflicts_with cask: "thunderbird@esr"
  depends_on macos: :ventura

  app "Betterbird.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/Betterbird.app"]
  end

  uninstall quit: "org.mozilla.betterbird"

  # Existing paths retained for future reference; these may be shared with Thunderbird.
  # zap trash: [
  #   "~/Library/Application Support/Thunderbird",
  #   "~/Library/Caches/Mozilla/updates/Applications/Thunderbird*",
  #   "~/Library/Caches/Thunderbird",
  #   "~/Library/Preferences/org.mozilla.betterbird*.plist",
  #   "~/Library/Thunderbird",
  # ],
  #   rmdir: "~/Library/Caches/Mozilla"

  caveats <<~EOS
    Betterbird's macOS build is not notarized. macOS may block it from opening.
    See the vendor's instructions: https://www.betterbird.eu/downloads/
  EOS
end
