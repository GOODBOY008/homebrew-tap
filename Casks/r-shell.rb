# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.5.0,1.5.0"
  
  on_arm do
    sha256 "5bc31d4650bd0dfc5d7b8703b739c1f5af04267143c6ed3f0e8158f1f8002bc9"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version.csv.second}/r-shell_#{version.csv.first}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "3a182481983e266c9f346909b6a7cc4b6797b206dc9c31a6111d2c161fdffb47"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version.csv.second}/r-shell_#{version.csv.first}_x64.dmg"
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
