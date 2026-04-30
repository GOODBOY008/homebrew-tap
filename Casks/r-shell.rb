# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.5.0,1.5.0"
  
  on_arm do
    sha256 "c432aadb4aa61c5cd4827e19349019f246c0a424f72c281780e1ee41b03404a8"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version.csv.second}/r-shell_#{version.csv.first}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "881599839478711fdd8cf4046496d135cb4968ec88dc49380427b55142b3ee73"
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
