class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.99.114"
  license :cannot_represent   # FSL-1.1-Apache-2.0; see LICENSING.md

  # Runtime dep: `yaver push` shells out to `npm exec --package
  # yaver-cli@<version>` which pulls hermesc + the RN bundler on
  # first use (see runPushBridge in desktop/agent/main.go). The
  # Go binary itself doesn't embed hermesc, so we depend on Node
  # to make Homebrew installs self-contained for push-to-device.
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.114/yaver-darwin-arm64.tar.gz"
      sha256 "02e08111ffb8ede0728e89815e5e3409c57d29d6f5bdbc2e8f541f226c2fdab3"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.114/yaver-darwin-amd64.tar.gz"
      sha256 "b2afb7cfe2996e109754e3e49ebbc34c50f448ec5483b15f5867b05b3859df8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.114/yaver-linux-arm64.tar.gz"
      sha256 "83546137f5944c9bac897d68131f12c8cfdc7a1ccab741bca863d108a0d90e62"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.99.114/yaver-linux-amd64.tar.gz"
      sha256 "971dd2e5d41d059113f480870a4660d0e8bc55ccc6d281535553840289188284"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
