cask "yaver" do
  version "1.0.0"
  sha256 "7485944ca5cef4b501ea470ca0597ee7c9a1d8bc449355cac5f05d39ac841e77"

  url "https://github.com/kivanccakmak/yaver-desktop/releases/download/v#{version}/yaver-#{version}-arm64.dmg"
  name "Yaver"
  desc "P2P desktop agent installer for Yaver"
  homepage "https://yaver.io"

  app "Yaver.app"
end
