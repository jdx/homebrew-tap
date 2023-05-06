class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.4/rtx-brew-v1.29.4-macos-x64.tar.xz"
      sha256 "f3121fed7740ac9b56bf8d596e3c2878d9223b59a5c05db0387528e4a090cf6e"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.4/rtx-brew-v1.29.4-macos-arm64.tar.xz"
      sha256 "9bbb34766423561c3938f67948e9c0fa96e270a01131bbddb693321fdaadfb32"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.4/rtx-brew-v1.29.4-linux-arm64.tar.xz"
      sha256 "ca71fd56880547b192b4a44702df87ac784dac439576f37a55998893cc21a8f8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.4/rtx-brew-v1.29.4-linux-x64.tar.xz"
      sha256 "2c2c824d2e775080da3051158039b074a9037bcb13f7f158abc603f4686eced7"
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
