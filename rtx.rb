class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.0/rtx-brew-v1.30.0-macos-x64.tar.xz"
      sha256 "57d0ac2fa5a15e4a11289bf95909d9caea8cedc7bcc43e0f32a48c1e0d47752c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.0/rtx-brew-v1.30.0-macos-arm64.tar.xz"
      sha256 "f7c0ff775abfdb327e9aa5f5a8ef6243a6e83c78a48e8d21ae03924614cab69c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.0/rtx-brew-v1.30.0-linux-arm64.tar.xz"
      sha256 "acd49e43e0a39ec2673c7eac93d2e57397cbbb1be2294d34dc948096a4b56283"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.0/rtx-brew-v1.30.0-linux-x64.tar.xz"
      sha256 "5f065894898552903e25040ac6fd90d7e53f21cf0c6cfb31dc5b28f637b7e298"
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
