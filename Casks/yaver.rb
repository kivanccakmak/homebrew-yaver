cask "yaver" do
  version "1.0.0"
  sha256 "9c58b980ba7713f761dff35b4000e007064aebed654f9e7289e1bba6aaca5af3"

  url "https://github.com/kivanccakmak/yaver-desktop/releases/download/v#{version}/yaver-#{version}-arm64.dmg"
  name "Yaver"
  desc "P2P desktop agent installer for Yaver"
  homepage "https://yaver.io"

  app "Yaver.app"
end
