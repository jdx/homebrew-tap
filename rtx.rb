class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.3/rtx-brew-v1.29.3-macos-x64.tar.xz"
      sha256 "5b9d2387d41b7f5d91d6882675d51ca5ac6a53ced3946ef053ada7fcb567b150"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.3/rtx-brew-v1.29.3-macos-arm64.tar.xz"
      sha256 "f181025b12500c0ae42dd93f2f963f099b43161f8617ef79949fc7e20f8716da"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.3/rtx-brew-v1.29.3-linux-arm64.tar.xz"
      sha256 "5b4804f9ee49d1d982375a667f06ca5dd672b58625d171caee0bc6bcc1649a3d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.3/rtx-brew-v1.29.3-linux-x64.tar.xz"
      sha256 "d1890a39cb0209a63858be8c23e3f6ea287ce7fbea8898bd8a5dce03d5bf27c7"
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
