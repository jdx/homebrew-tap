class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.7/rtx-brew-v1.23.7-macos-x64.tar.xz"
      sha256 "28044299e9d24798eb30f69fcb9a144f3f8bb5541bfecd12378b79473a27f461"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.7/rtx-brew-v1.23.7-macos-arm64.tar.xz"
      sha256 "64c177109d2190234d98e1cb53e27a2d30dec0704b910375303f3f90d6d3e7ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.7/rtx-brew-v1.23.7-linux-arm64.tar.xz"
      sha256 "45a8780821cb23d7ec8707f99eb3a1a0c07b4c2799a385e8ea623f6abbb86753"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.7/rtx-brew-v1.23.7-linux-x64.tar.xz"
      sha256 "838ec7269e84d6875b9e46615ae0809dfa2c05576f86ad9794895530c389a6ae"
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
