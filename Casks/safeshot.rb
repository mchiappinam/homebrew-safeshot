cask "safeshot" do
  version "1.3.0"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-Intel-x64.dmg"
    sha256 "7bea5063d005768332aa4f316791efcba993c2086ff47cfc4d9f541cdbb30c9a"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-AppleSilicon-aarch64.dmg"
    sha256 "2aa9205ba8df4644a62bb0abcc207a2cef4287d5bf060adbc6a9c57d057087b8"
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
