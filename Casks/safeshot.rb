cask "safeshot" do
  version "1.3.1"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-Intel-x64.dmg"
    sha256 "0ccd39fdcf4b8af396c8b007d87758c0c5244e6d693359cce4afd9d350288d6f"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-#{version}-macOS-AppleSilicon-aarch64.dmg"
    sha256 "2596688cedfc65b4d2dc499e81bfc6fabb03b9a122eef9cf4835a8592c2fac81"
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
