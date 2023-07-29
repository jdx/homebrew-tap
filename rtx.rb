class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.2/rtx-brew-v1.35.2-macos-x64.tar.xz"
      sha256 "e4ae72b8af4a418960a8e187d65665a7a3afd3812a5e5ef6fd4821a5c2788ec2"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.2/rtx-brew-v1.35.2-macos-arm64.tar.xz"
      sha256 "482997d7baddc23a0b71e73132492fbbae6f443e02ebee8803be3ecc8f50684f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.2/rtx-brew-v1.35.2-linux-arm64.tar.xz"
      sha256 "81cf68b4f3a25fe09e2072661e908bfb8c9fa0f8a709c6cceb041f88c62d9a6e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.2/rtx-brew-v1.35.2-linux-x64.tar.xz"
      sha256 "494dfd9acc5ab6193ea488c83047cb36a87bfcd76c96c064cfd3eabbc5f87168"
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
