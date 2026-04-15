cask "safeshot" do
  version "1.3.3"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-Intel-x64.dmg"
    sha256 "27581c3f8d10b5577334b5b7ccbce001ea581019b2b4cdf3fa91aa700a531f0d"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-AppleSilicon-aarch64.dmg"
    sha256 "85320a3d18da5a0fb7aaa69843da36cf8b45ace7bee0bbb8004a72eb87a61b92"
  end

  name "SafeShot"
  desc "Privacy-first screenshot tool. No cloud, no tracking."
  homepage "https://github.com/mchiappinam/SafeShot"

  app "SafeShot.app"

  zap trash: [
    "~/Library/Application Support/SafeShot",
    "~/Library/LaunchAgents/com.chiappina.safeshot.plist",
  ]
end
