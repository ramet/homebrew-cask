cask "sublime-text" do
  # NOTE: The first digit of the build number is the major version.
  version "4142"
  sha256 "d7c2efbcbe2d74005d84025f5bf95034037a9f0af3ccd45af58b84721d68798a"

  url "https://download.sublimetext.com/sublime_text_build_#{version}_mac.zip"
  name "Sublime Text"
  desc "Text editor for code, markup and prose"
  homepage "https://www.sublimetext.com/"

  livecheck do
    url "https://www.sublimetext.com/download_thanks?target=mac"
    regex(/href=.*?v?(\d+)_mac\.zip/i)
  end

  auto_updates true
  conflicts_with cask: "sublime-text-dev"

  app "Sublime Text.app"
  binary "#{appdir}/Sublime Text.app/Contents/SharedSupport/bin/subl"

  uninstall quit: "com.sublimetext.#{version[0]}"

  # Sublime Text 4 uses `Sublime Text 3` and `com.sublimetext.3` dirs if they exist
  # Otherwise, it creates `Sublime Text` and `com.sublimetext.4`
  # More info: https://www.sublimetext.com/docs/side_by_side.html
  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.sublimetext.#{version[0]}.sfl*",
    "~/Library/Application Support/Sublime Text",
    "~/Library/Application Support/Sublime Text (Safe Mode)",
    "~/Library/Application Support/Sublime Text 3",
    "~/Library/Caches/com.sublimetext.#{version[0]}",
    "~/Library/Caches/com.sublimetext.3",
    "~/Library/Caches/Sublime Text",
    "~/Library/Caches/Sublime Text (Safe Mode)",
    "~/Library/Caches/Sublime Text 3",
    "~/Library/HTTPStorages/com.sublimetext.#{version[0]}",
    "~/Library/HTTPStorages/com.sublimetext.3",
    "~/Library/Preferences/com.sublimetext.#{version[0]}.plist",
    "~/Library/Preferences/com.sublimetext.3.plist",
    "~/Library/Saved Application State/com.sublimetext.#{version[0]}.savedState",
    "~/Library/Saved Application State/com.sublimetext.3.savedState",
  ]
end
