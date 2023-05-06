class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.5/rtx-brew-v1.29.5-macos-x64.tar.xz"
      sha256 "3da866e5c4953d54f56271deb2fca607621ec28541b078f0f0938d2f86a6138b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.5/rtx-brew-v1.29.5-macos-arm64.tar.xz"
      sha256 "a8253902a964e1f5a913ac3a669913414de6dcb79a9e737d566a55fd9f1447e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.5/rtx-brew-v1.29.5-linux-arm64.tar.xz"
      sha256 "5c39a7cce57cecc942413000f5ed1edc43bb4e050372f51c4b469cfe86750fcf"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.5/rtx-brew-v1.29.5-linux-x64.tar.xz"
      sha256 "f879eaa9779c07f6ea7e151bef12d19b6df04dcf963cfc203ac16e0e9717d762"
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
