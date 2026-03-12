class Yaver < Formula
  desc "Use Claude from anywhere — P2P CLI for Yaver"
  homepage "https://yaver.io"
  version "1.0.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "2cb028e0602a0d55061677bd0b99dde12d5c609a798a742c69be6474d6524d04"
    else
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "10e11e672093a84d70040e17b002a25931e9d26877d52fe22fa010a0188d261d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "0dc10ff61bd2058e81d9335dd8972353fa45dd3f5592738d4db0f6e8eaa318c7"
    else
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "9ebd49b11a8291c8d7eeb520e7ceb36786193adeae445543c0c7a1b66d11c31f"
    end
  end

  def install
    binary = Dir.glob("yaver-*").first || "yaver"
    bin.install binary => "yaver"
    chmod "+x", bin/"yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
