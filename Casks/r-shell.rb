# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "2.6.0"
  
  on_arm do
    sha256 "974bd6d616b1b38c918c04a39a9020bc047ef17d2ea016a0092251a7dfb9ce73"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "3df40b6a928fa0eefe1e54412a72487f3943adf5bac52d26ddf54f7e0025bef2"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_x64.dmg"
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
