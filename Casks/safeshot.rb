cask "safeshot" do
  version "1.1.66"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-macOS-Intel-x64.dmg"
    sha256 "008c665dce8437c5422ec23dc4b56c25871335638e5baf5f8da1100500f0f8e9"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-macOS-AppleSilicon-aarch64.dmg"
    sha256 "9cecce1e482065549920dc56530f1631c2cdf7900957e678d2047620138eecae"
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
