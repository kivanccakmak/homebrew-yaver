class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.105"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.105/yaver-darwin-arm64.tar.gz"
      sha256 "6f2e1f1be93992d99e0e395f8a7985f4b9c70530721d16e8ede5ad209eedf218"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.105/yaver-darwin-amd64.tar.gz"
      sha256 "929ddd38877f7707f4f03fd2cfea2948a3ebd7c104a750d316217c32c4a064de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.105/yaver-linux-arm64.tar.gz"
      sha256 "810f4ad6f0b432654ddacedde0075bce41e10698aef25aa863f3ee3e892322ed"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.105/yaver-linux-amd64.tar.gz"
      sha256 "12af6b50ee302d348087d6ea1657b99249049649e08074d7ef5da58a4d37ef68"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
