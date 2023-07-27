class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.1/rtx-brew-v1.35.1-macos-x64.tar.xz"
      sha256 "2a65fe27c559e34c21733ec42723008ce017c63390402793284e760d76eae787"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.1/rtx-brew-v1.35.1-macos-arm64.tar.xz"
      sha256 "c48eebce4fd1a0a48a182aa118b2caa923b4be7e7ccbab24e9cedc8920bf76d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.1/rtx-brew-v1.35.1-linux-arm64.tar.xz"
      sha256 "07e7eba1db880fecdf805a82cefbeee45a30154e6c7a56f2d19dfc7156f66f83"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.1/rtx-brew-v1.35.1-linux-x64.tar.xz"
      sha256 "062217533da5f1eae8716fe6780cd7f30f8e268d1233a8df746d87cbe769059b"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
