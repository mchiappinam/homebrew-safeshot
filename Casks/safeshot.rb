cask "safeshot" do
  version "1.4.3"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-Intel-x64.dmg"
    sha256 "357f757a76a08c8afce697210ac49310ba885a0062c5d4f88c630a6c20c81ed5"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-AppleSilicon-aarch64.dmg"
    sha256 "301402f8db1e08de11943685a526bf7189252b337b8682628f6fddf19afd8606"
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
