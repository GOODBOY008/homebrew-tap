# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "0.6.4"
  
  on_arm do
    sha256 "f9ebe107dce01613f9412e9f35aa8ec7898a17ba6919d5177eee8fdaf2171a1e"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "b1b7c178f64fe6b91c10bbc4918fd33b2e044b2d496543eafe42d1b53de3f83d"
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

  # Cleanup user data on uninstall
  zap trash: [
    "~/Library/Application Support/com.aiden.r-shell",
    "~/Library/Caches/com.aiden.r-shell",
    "~/Library/Preferences/com.aiden.r-shell.plist",
    "~/Library/Saved Application State/com.aiden.r-shell.savedState",
    "~/Library/WebKit/com.aiden.r-shell",
  ]
end
