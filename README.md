# Homebrew Betterbird

A Homebrew tap for installing the English (US), Apple Silicon build of [Betterbird](https://www.betterbird.eu/).

## Install

```sh
brew tap gontadu/homebrew-betterbird
brew install --cask betterbird
```

## Notes

- Requires macOS Ventura or later.
- Conflicts with the `thunderbird@esr` cask.
- The cask follows Betterbird's current release download and uses `sha256 :no_check`, so Homebrew does not verify the downloaded DMG's checksum.
- Betterbird's macOS build is not notarized. The cask removes the quarantine attribute from `/Applications/Betterbird.app` after installation so macOS can open it. This bypasses Gatekeeper's quarantine check; see [Betterbird's Mac instructions](https://www.betterbird.eu/downloads/) for details.
- Uninstalling the cask does not remove Betterbird or Thunderbird profile data.

## Cask updates

A daily GitHub Actions workflow checks Betterbird's downloads page, updates the cask version when a new release is found, runs `brew style`, and opens a pull request for review. You can also run it manually from the repository's Actions tab.

The workflow updates only the version; the cask uses the moving release URL and `sha256 :no_check`, so Homebrew does not verify the downloaded DMG's checksum.

## License

This tap is licensed under the [MIT License](LICENSE). Betterbird is distributed under its own license.
