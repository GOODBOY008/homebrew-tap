# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "3.0.0"
  
  on_arm do
    sha256 "01ef5d5cf3ef3ba3db80e8847a5d5ee5f9f44f28643b94154328bce3ab6b3117"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "48c3abf3b8e8c9400a40c2e2b8d7df975521015c7627b20e9aa81a8aab7cf9c5"
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
