# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "1.4.0,1.4.0"
  
  on_arm do
    sha256 "58b739a1e40bb42acf754c5beb1fe994c3769e87f80823ce668563bd8af4d560"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version.csv.second}/r-shell_#{version.csv.first}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "9dac517bcea44f3e42a526639a6f79aa526653424623cbf98084647d6daf8977"
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
