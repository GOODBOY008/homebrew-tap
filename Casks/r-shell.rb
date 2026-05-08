# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.6.0,1.6.0"
  
  on_arm do
    sha256 "5dbe306e6b3274d046ba10f458e7224ac7e0bb3dcaca62131750a43cf4c24523"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version.csv.second}/r-shell_#{version.csv.first}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "e9a093e1a20eed97876b44c63fbb45326ff7fda58cfd791769f3ee1b86a68238"
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
