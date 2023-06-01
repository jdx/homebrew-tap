class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.6/rtx-brew-v1.30.6-macos-x64.tar.xz"
      sha256 "48f5ce14331bf57f85d5a823228592806256d2695716359101aaec60a1649d42"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.6/rtx-brew-v1.30.6-macos-arm64.tar.xz"
      sha256 "d4324792d3e53b7816c93848f39f8ca99ae9b25900774e5e8e9c119ca7a2f53a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.6/rtx-brew-v1.30.6-linux-arm64.tar.xz"
      sha256 "7855d6b96f860edd5b7a17de8c369745f35eb521afce3766f293d681e0c83b0a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.6/rtx-brew-v1.30.6-linux-x64.tar.xz"
      sha256 "dc9126810f7dacf7f7a42f13bf78dfd91e159ee5620a612d6e70792e6c8ad9d4"
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
