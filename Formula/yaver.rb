class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.83"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.83/yaver-darwin-arm64.tar.gz"
      sha256 "451a506edf5a2e0389fa64e42d5ab7fce28ebb9eef0695ba7849b57335761415"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.83/yaver-darwin-amd64.tar.gz"
      sha256 "6b3ce870027cf47f10010ca42061035c4dec1f4f1f4296a2098ac77aa5f1b627"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.83/yaver-linux-arm64.tar.gz"
      sha256 "6f42762ad69e24a71335401e60f5554f3724bd60f4a03faf0539e1694797d06d"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.83/yaver-linux-amd64.tar.gz"
      sha256 "b5bd1b33237173642bb78e3ee5191158c0401b3debb479d774bad60510d309ed"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
