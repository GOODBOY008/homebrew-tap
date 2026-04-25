# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.3.1,1.4.0"
  
  on_arm do
    sha256 "c9ab474bab494f19ea9482d6dd2775fb23326cf01d86ee06e93e3bdc942dbeaf"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v1.4.0/r-shell_1.3.1_aarch64.dmg"
  end
  
  on_intel do
    sha256 "ba876ece60b005f854a1c9f5b0618ac63491ea0a7fb19c6c823f88bbdbac32e6"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v1.4.0/r-shell_1.3.1_x64.dmg"
  end

  name "r-shell"
  desc "Modern SSH terminal client built with Tauri and React"
  homepage "https://github.com/GOODBOY008/r-shell"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "r-shell.app"

  # Cleanup user data on uninstall
  zap trash: [
    "~/Library/Application Support/com.aiden.r-shell",
    "~/Library/Caches/com.aiden.r-shell",
    "~/Library/Preferences/com.aiden.r-shell.plist",
    "~/Library/Saved Application State/com.aiden.r-shell.savedState",
    "~/Library/WebKit/com.aiden.r-shell",
  ]
end
