# Homebrew Cask for r-shell
# Auto-updated by GitHub Actions

cask "r-shell" do
  version "3.1.3"
  
  on_arm do
    sha256 "ab375466fa3804684725f8c510af26b983cdb1208fe12982276c02e8cdf040d2"
    url "https://github.com/GOODBOY008/r-shell/releases/download/v#{version}/r-shell_#{version}_aarch64.dmg"
  end
  
  on_intel do
    sha256 "2e8ee19c1cfa185c6b639c8d14ab4f71d7a0d10fa36e00e2a4fefb288b43fabb"
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
