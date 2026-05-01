class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.102"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.102/yaver-darwin-arm64.tar.gz"
      sha256 "2175055f6395dbbe73bc3acf6ac7ae5cc69a12f701b7ddf2f0b7a1fd28f2ab14"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.102/yaver-darwin-amd64.tar.gz"
      sha256 "442a4e503a6d18a3c57393cb73e8008226ad4363d049589310a1165ca062f1f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.102/yaver-linux-arm64.tar.gz"
      sha256 "a351ec638dbfc5a3b3f8362ae05a690ec5ebde8173726dc552cbe1aa50ceb01f"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.102/yaver-linux-amd64.tar.gz"
      sha256 "8fd96848276a8177dce0a9403de827d34c9626a8a17ffc90c98b6a396c73fb0e"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
