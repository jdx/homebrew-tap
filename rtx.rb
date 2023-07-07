class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.32.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.5/rtx-brew-v1.32.5-macos-x64.tar.xz"
      sha256 "8a0cbea1447c418ccb24b8346cd3bb367622ad74e2bcf1450a28e340e304d16f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.32.5/rtx-brew-v1.32.5-macos-arm64.tar.xz"
      sha256 "3828817c998a495e58e79c38b1ac8c16e9204349c8ab2618cd1c7b0c0f65f5cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.32.5/rtx-brew-v1.32.5-linux-arm64.tar.xz"
      sha256 "db89fa09a470a13e09c7b4985f3f6f7d232f2734305dc88b29dc4da59287545e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.5/rtx-brew-v1.32.5-linux-x64.tar.xz"
      sha256 "a3bcb2560be8c14ca422e2d4487ba7b336f1448faaa004f326a99532cbe9a3e6"
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
