class Yaver < Formula
  desc "P2P desktop agent installer for Yaver"
  homepage "https://yaver.io"
  version "1.0.0"
  license "Proprietary"

  on_linux do
    url "https://github.com/kivanccakmak/yaver-desktop/releases/download/v#{version}/yaver-#{version}-arm64.AppImage"
    sha256 "c2b6d7d4c6cbdc88d8ab8049cde61b144c1bf7068d43aa2abca4fb2da1e26eb5"
  end

  def install
    appimage = "yaver-#{version}-arm64.AppImage"
    bin.install appimage => "yaver"
    chmod "+x", bin/"yaver"
  end
end
