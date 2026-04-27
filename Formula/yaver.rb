class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.73"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.73/yaver-darwin-arm64.tar.gz"
      sha256 "497b8ac94aefb3dda2d854adb736960b57f09b96d3a639ebc0435ca2c854be56"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.73/yaver-darwin-amd64.tar.gz"
      sha256 "5999df74ec8d0d9f39485a367b7a55baee03610d57710172cc4e28659dcdf8d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.73/yaver-linux-arm64.tar.gz"
      sha256 "812fe07ee099ee4087f8d3117f89f15d280f983897c18c73ab4c42e522ea7b3e"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.73/yaver-linux-amd64.tar.gz"
      sha256 "2852a36f081c2a7467efe8f4fb75c59cddf43e7fc69ac96d439619cbb508f658"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
