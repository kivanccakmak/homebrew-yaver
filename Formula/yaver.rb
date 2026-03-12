class Yaver < Formula
  desc "Use Claude from anywhere — P2P CLI for Yaver"
  homepage "https://yaver.io"
  version "1.0.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-arm64"
      sha256 "b44c8ef7024df51cc1df9d3f5b001051b4ce3c1489df7c63a05c02a26a3e7c40"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-darwin-amd64"
      sha256 "a1ff037323fbf61c1d1eb50e58e1f64bceb25498880cfc15b131d2a44c0f831a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-arm64"
      sha256 "393316a23dce080dde2421deb9c99049930a6f1ca0d08af94be87e6a5d13b7cd"
    end
    on_intel do
      url "https://github.com/kivanccakmak/yaver-cli/releases/download/v#{version}/yaver-linux-amd64"
      sha256 "732decf714b83c8ef3d70e4e80409fa1beab1d86c2a36592e1e1418a4c5f5fa4"
    end
  end

  def install
    binary = Dir.glob("yaver-*").first || "yaver"
    bin.install binary => "yaver"
    chmod "+x", bin/"yaver"
  end

  def caveats
    <<~EOS
      To use yaver, make sure Homebrew's bin is in your PATH:

        # For bash — add to ~/.bashrc or ~/.bash_profile:
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # For zsh — add to ~/.zshrc:
        eval "$(/opt/homebrew/bin/brew shellenv)"

      Then restart your terminal or run:
        source ~/.zshrc  # or source ~/.bashrc

      Get started:
        yaver auth        Sign in (opens browser)
        yaver serve       Start the agent on this machine
        yaver connect     Connect to your dev machine
    EOS
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
