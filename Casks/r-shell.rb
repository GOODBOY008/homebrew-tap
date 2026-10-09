# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "3.0.3"
  
  on_arm do
    sha256 "aa47f16898e5690d3bfb93b41ebef6d45a0c30a6e24fbad403b484059fef8851"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "61da48fa6b36af3c4606a2ef1618d17f2fcd70d42692384a57b17410f3b68e0f"
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

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/r-shell.app"]
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
