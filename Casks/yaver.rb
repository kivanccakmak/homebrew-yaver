cask "yaver" do
  version "1.0.1"
  sha256 "de423ed79df0b9e8adf6729c8ecfd2ecbfca8731ca5201d8e8730ba6efc34546"

  url "https://github.com/kivanccakmak/yaver-desktop/releases/download/v#{version}/Yaver-#{version}-arm64.dmg"
  name "Yaver"
  desc "P2P desktop agent manager for Yaver"
  homepage "https://yaver.io"

  app "Yaver.app"
end
