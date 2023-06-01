class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.5/rtx-brew-v1.30.5-macos-x64.tar.xz"
      sha256 "6a08443e4e049b170b77230a6a251bb6800ad6ee24bf3180a47baa91078c746c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.5/rtx-brew-v1.30.5-macos-arm64.tar.xz"
      sha256 "ebe6ab4f6aa5b5c97cce944f00f21d7b58b392a82d1c3199cadc8ad1831e7845"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.5/rtx-brew-v1.30.5-linux-arm64.tar.xz"
      sha256 "40a2331edae020459a621e4b3bb2a02b7ad6cdf7bb9eabf6c9897b862cbc186d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.5/rtx-brew-v1.30.5-linux-x64.tar.xz"
      sha256 "3c255aa73e0f2368f3af417a62203d3344b0aeba8abf65c3975ae4cb02bdf009"
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
