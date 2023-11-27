class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.7/rtx-nonup-v2023.11.7-macos-x64.tar.xz"
      sha256 "b91e035e85dff2bf45a8d3cc9dc008f5f96694196ef8dc82e0ff8a2e6b6b32b0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.7/rtx-nonup-v2023.11.7-macos-arm64.tar.xz"
      sha256 "cff75ed094338ac8424ba854a86f9b4a4a54bf12971fbfa00d8e360c237566d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.7/rtx-nonup-v2023.11.7-linux-arm64.tar.xz"
      sha256 "36d7448b1523829f72ecf6111bce10cf2d1dbfbce6c70581cc984cc6f9623af0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.7/rtx-nonup-v2023.11.7-linux-x64.tar.xz"
      sha256 "25bb1a1afa36306392f16f6c3e662ea26a8ae97dd387b3156810c4470e8b7811"
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
