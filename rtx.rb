class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.19.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.19.0/rtx-brew-v1.19.0-macos-x64.tar.xz"
      sha256 "57dfe0c0344e068483dbe92f0dcab9dfad13dbe707c789fd8d4c6bf2a69c721b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.19.0/rtx-brew-v1.19.0-macos-arm64.tar.xz"
      sha256 "cdeaf0d6e4f0d7631126f4e7bbafdb4fed77ce1c73f81da4fb404415492f0934"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.19.0/rtx-brew-v1.19.0-linux-arm64.tar.xz"
      sha256 "cdb558653cfec9202dd29da56b54f093db158956ce0a80ea917c56f1b8120cc5"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.19.0/rtx-brew-v1.19.0-linux-x64.tar.xz"
      sha256 "3143f698f4a38b818a705c21c070b6146e5bb09418f42a668f37e7cd8118ecfb"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "complete", "--shell")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
