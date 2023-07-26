class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.0/rtx-brew-v1.35.0-macos-x64.tar.xz"
      sha256 "82d61f03ecd5c9d198281a8ac931b7ed3e878e48d2d06db43d1a8d3d4bf52036"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.0/rtx-brew-v1.35.0-macos-arm64.tar.xz"
      sha256 "61aec5df9fe7d3f3021ae1a65fa2dcacd0fe86b0c3075a7a198c89dbe5989a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.0/rtx-brew-v1.35.0-linux-arm64.tar.xz"
      sha256 "d9831772a2c079d5d82d6fc399eb1279fed83fffd356b9ed394d54efa4c01d98"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.0/rtx-brew-v1.35.0-linux-x64.tar.xz"
      sha256 "65b4706305212c8b15183e9399ab313c5bdd4f68ea7a1265f1c9b860f55d53c0"
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
