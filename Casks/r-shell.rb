# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.7.0"
  
  on_arm do
    sha256 "112f1569fe2525083ed13cb7adc824ac0d638c249973e872bdc31400d6cd0442"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{TAG_VERSION}/r-shell_#{ASSET_VERSION}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "ee12a89cd6d3902320bc0ae086c7c16cf35e7772f082601ba90d85e5be705748"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{TAG_VERSION}/r-shell_#{ASSET_VERSION}_x64.dmg"
  end

  name "r-shell"
  desc "Modern SSH terminal client built with Tauri and React"
  homepage "https://github.com/GOODBOY008/r-shell"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "r-shell.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/r-shell.app"],
                   sudo: false
  end

  # Cleanup user data on uninstall
  zap trash: [
    "~/Library/Application Support/com.aiden.r-shell",
    "~/Library/Caches/com.aiden.r-shell",
    "~/Library/Preferences/com.aiden.r-shell.plist",
    "~/Library/Saved Application State/com.aiden.r-shell.savedState",
    "~/Library/WebKit/com.aiden.r-shell",
  ]
end
