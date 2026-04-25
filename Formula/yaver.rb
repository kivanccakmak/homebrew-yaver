class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.42"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.42/yaver-darwin-arm64.tar.gz"
      sha256 "3072feb8c19ebe25ffda17c6bf3b502af8c2513ae858f4036e79d3f4359d1542"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.42/yaver-darwin-amd64.tar.gz"
      sha256 "38032ee9afe9f2ac7e3c15fa88c1f46728198b42b18e7af1191e4e28be828292"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.42/yaver-linux-arm64.tar.gz"
      sha256 "a8e67b6b3bb87e73ea2904dd05aac45963aa37b5083aae02ffac6c579105f5bc"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.42/yaver-linux-amd64.tar.gz"
      sha256 "6f841181315cb9161a741000dc187301060b2f94bd184f51ae0ef602f0fcf578"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
