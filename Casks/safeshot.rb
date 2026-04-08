cask "safeshot" do
  version "1.0.0"

  on_intel do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-macOS-Intel-x64.dmg"
    sha256 "d0c3aec6b246f9ccdb95848de336038fb8abb78cd78bef39f05071de10bc28d1"
  end

  on_arm do
    url "https://github.com/mchiappinam/SafeShot/releases/download/v#{version}/SafeShot-macOS-AppleSilicon-aarch64.dmg"
    sha256 "769389e1ca8f150e6351eb61d472fbb5f34364f11f0af9c06e3de15485dca45f"
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
