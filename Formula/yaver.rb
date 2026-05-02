class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.109"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.109/yaver-darwin-arm64.tar.gz"
      sha256 "2cd02dbabc99078419bef7643ec56608abed82229f3e8d70ffcbef558806ec77"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.109/yaver-darwin-amd64.tar.gz"
      sha256 "55999cdf6a0722c4dc5cdeb4f6d45b054be5d3e0d066e4b140a0dc204a3e3ebb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.109/yaver-linux-arm64.tar.gz"
      sha256 "43fb57dca3628bcb6fb70cfba09dec60ca13352920df1ce9d5210a6e24667342"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.109/yaver-linux-amd64.tar.gz"
      sha256 "e50f31a01a06859a5391d3ce34787d09f9f46c07b0f2a4a936a9c88d2f3a857d"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
