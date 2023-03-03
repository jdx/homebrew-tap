class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.20.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.4/rtx-brew-v1.20.4-macos-x64.tar.xz"
      sha256 "4f876ae0bb9c009e1b03e45aa274dcf1f37626e75c84f1b73e14d23cf03c9242"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.20.4/rtx-brew-v1.20.4-macos-arm64.tar.xz"
      sha256 "670739326ca04027ef8772f192089322f1c31d8c8b4869825170a5b570e02709"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.20.4/rtx-brew-v1.20.4-linux-arm64.tar.xz"
      sha256 "fc2fcb41ff2f8b42299ca02a2fa3b019fd56ad57b3bd114dd2ba058cc85602d0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.4/rtx-brew-v1.20.4-linux-x64.tar.xz"
      sha256 "a27ae34d3a46b011dfccb1ba28c94687321aae0c826c99ae939c98a78d186167"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "complete", "--shell")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
