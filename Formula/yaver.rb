class Yaver < Formula
  desc "AI coding agent on your phone — P2P remote control for Claude Code, Codex, Aider, Ollama"
  homepage "https://yaver.io"
  version "1.95.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.3/yaver-darwin-arm64.tar.gz"
      sha256 "c987a61cbb78ac32b64d612b32252c19c57ac8cdf43e42d21dff679db8bec5c9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.3/yaver-darwin-amd64.tar.gz"
      sha256 "ac10b48b3adaf0f67239c6489ffa525d249084151e5f8049a88e75ec9fe43692"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.3/yaver-linux-arm64.tar.gz"
      sha256 "52fe7215d2f128848143a157faf641d1414b88a0e4c8a268f874e2c614a33ca9"
    else
      url "https://github.com/kivanccakmak/yaver.io/releases/download/v1.95.3/yaver-linux-amd64.tar.gz"
      sha256 "bae44d1c0d8e855c57c4919ee3b19adc24ffe32deb447ca39a06df8cee0f5e12"
    end
  end

  def install
    bin.install "yaver"
  end

  test do
    assert_match "yaver", shell_output("#{bin}/yaver version")
  end
end
