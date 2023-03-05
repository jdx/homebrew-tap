class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.6/rtx-brew-v1.21.6-macos-x64.tar.xz"
      sha256 "b393c428635224e0e96da353597aa9446e5e422e01824aad36730d34da11d5d6"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.6/rtx-brew-v1.21.6-macos-arm64.tar.xz"
      sha256 "35f7eb047e07784e12c6730309561f4a14650db94defd863a963f7682d2ede1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.6/rtx-brew-v1.21.6-linux-arm64.tar.xz"
      sha256 "2eafe3ba083c9df118dfd159bb72efecc373fe88cae7593f588c5c9102ee9c61"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.6/rtx-brew-v1.21.6-linux-x64.tar.xz"
      sha256 "37fd0611428f28e1166085a7f1e11f76f0810030ff2df5a869aa3caa9d781264"
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
