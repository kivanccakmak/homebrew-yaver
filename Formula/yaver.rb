class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.80.0/yaver-darwin-arm64.tar.gz"
      sha256 "1c08b576d05d07e656d755280a6ed405b498bf693a951b3cb1e73a6fcc6cddda"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.80.0/yaver-darwin-amd64.tar.gz"
      sha256 "8f98c438051df2fab210ce77cb053dd1bd4c94575b94a1022b49ebe35ee4fb8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.80.0/yaver-linux-arm64.tar.gz"
      sha256 "9b4bbd06cbeda3ac4c98847639835c9eb9fa9310f8688699fc05605c02ec9468"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.80.0/yaver-linux-amd64.tar.gz"
      sha256 "0ed0ec33ad94e0d2c3a3a2b7bc4bdb8f13790bb8f3cba23a3a70b4d0c654020c"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
