cask "safeshot" do
  version "1.3.0"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-Intel-x64.dmg"
    sha256 "a11437d4e6e4973dd40c6f2975ddf050d11f5425dec98cd27bfc7c56cd853d30"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-AppleSilicon-aarch64.dmg"
    sha256 "eec42c4542049e05671b444f901076a468023e93b084517a39859b133ef10b58"
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
