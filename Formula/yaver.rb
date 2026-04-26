class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.56"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.56/yaver-darwin-arm64.tar.gz"
      sha256 "3157363596a192b540a1a3673bd56111920e56934cf879c87087814db17005a4"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.56/yaver-darwin-amd64.tar.gz"
      sha256 "9c5c16820955569ac62c58bcca1f1b9b0cc43ce8d251edebd735e7acf9429960"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.56/yaver-linux-arm64.tar.gz"
      sha256 "ba36599941db2fbebdabb21619e51b97d4cb260f1f7df978193e98732a1a5fb6"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.56/yaver-linux-amd64.tar.gz"
      sha256 "f27646a47630b07d718c9077f3c2d7cee1f0e5bb088a2498c521e65ba12adaa2"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
