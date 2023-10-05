class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.10.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.1/rtx-nonup-v2023.10.1-macos-x64.tar.xz"
      sha256 "a2c0338a39c6af356c98daa1db0d6b3c9082cf419788a5ba2fc27d716b333303"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.10.1/rtx-nonup-v2023.10.1-macos-arm64.tar.xz"
      sha256 "81710394cc3c8c33def209385299470e69fa9bee9e9fa28df2b35e447200f95e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.10.1/rtx-nonup-v2023.10.1-linux-arm64.tar.xz"
      sha256 "03bbe9817a8156f1e3aa9c0c71b154b2a7fe94f79bd39d37a3dc2d4f87d8485e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.1/rtx-nonup-v2023.10.1-linux-x64.tar.xz"
      sha256 "ab8274b368b7450727c00788c322f4ef3e56c337bd59a75287d84b43e6685cf2"
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
