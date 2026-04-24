class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.27"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.27/yaver-darwin-arm64.tar.gz"
      sha256 "468575e1d2d6be2e638b98eccf146decace80eb452017cf8630209e478db153a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.27/yaver-darwin-amd64.tar.gz"
      sha256 "3902d21a0f7f51292e7470cff8e4b2b2c726a201c1a43b40ba87fcec7b7786f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.27/yaver-linux-arm64.tar.gz"
      sha256 "2991299cfa3d1cd9bde6c17807e587687fba87555d7391a434b50bd3d91f753e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.27/yaver-linux-amd64.tar.gz"
      sha256 "d76a29b7308f806f3a229d20a531409566f93d0e2fbf422702ce71a2cf2f7b82"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
