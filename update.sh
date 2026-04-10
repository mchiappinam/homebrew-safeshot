#!/bin/bash
set -e

REPO="mchiappinam/SafeShot"
CASK_FILE="Casks/safeshot.rb"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Get latest release version from GitHub API
echo "Fetching latest release..."
VERSION=$(curl -sL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name"' | sed 's/.*"v\(.*\)".*/\1/')

if [ -z "$VERSION" ]; then
  echo "Error: could not fetch latest release version"
  exit 1
fi

echo "Latest release: v$VERSION"

# Download DMGs and compute SHA256
INTEL_URL="https://github.com/$REPO/releases/download/v$VERSION/SafeShot-macOS-Intel-x64.dmg"
ARM_URL="https://github.com/$REPO/releases/download/v$VERSION/SafeShot-macOS-AppleSilicon-aarch64.dmg"

echo "Downloading Intel DMG..."
INTEL_SHA=$(curl -sL "$INTEL_URL" | sha256sum | awk '{print $1}')
echo "  SHA256: $INTEL_SHA"

echo "Downloading ARM DMG..."
ARM_SHA=$(curl -sL "$ARM_URL" | sha256sum | awk '{print $1}')
echo "  SHA256: $ARM_SHA"

if [ ${#INTEL_SHA} -ne 64 ] || [ ${#ARM_SHA} -ne 64 ]; then
  echo "Error: failed to download DMGs. Is the release published?"
  exit 1
fi

cat > "$SCRIPT_DIR/$CASK_FILE" << EOF
cask "safeshot" do
  version "$VERSION"

  on_intel do
    url "https://github.com/$REPO/releases/download/v#{version}/SafeShot-macOS-Intel-x64.dmg"
    sha256 "$INTEL_SHA"
  end

  on_arm do
    url "https://github.com/$REPO/releases/download/v#{version}/SafeShot-macOS-AppleSilicon-aarch64.dmg"
    sha256 "$ARM_SHA"
  end

  name "SafeShot"
  desc "Privacy-first screenshot tool. No cloud, no tracking."
  homepage "https://github.com/$REPO"

  app "SafeShot.app"

  zap trash: [
    "~/Library/Application Support/SafeShot",
    "~/Library/LaunchAgents/com.chiappina.safeshot.plist",
  ]
end
EOF

echo "Updated $CASK_FILE"

cd "$SCRIPT_DIR"
git add -A
git commit -m "v$VERSION"
git push origin main

echo ""
echo "Brew cask updated to v$VERSION and pushed."
