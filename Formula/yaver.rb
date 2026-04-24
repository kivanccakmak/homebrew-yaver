class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.33"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.33/yaver-darwin-arm64.tar.gz"
      sha256 "82358a67bab319abaccfbd2eb2532df26f0a4083da08ea834abc9e256623f60a"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.33/yaver-darwin-amd64.tar.gz"
      sha256 "9773a5bb46e3008d0ed74f848f6a729fc3215e94bb72d719874dfee881bb5d2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.33/yaver-linux-arm64.tar.gz"
      sha256 "b21f55519b7242922cc5a6ed7b276e00a501517f3d29926a14c2bfa5e487bed3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.33/yaver-linux-amd64.tar.gz"
      sha256 "155588a77c10154b14aeae3f1b25a88445a39b8ca921f6e0dfed783cd4040105"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
