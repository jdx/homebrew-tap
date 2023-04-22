class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.0/rtx-brew-v1.29.0-macos-x64.tar.xz"
      sha256 "54d6b7076a1d5dc8bceab1b87397563dd92833d2c772aac87976491e2dfb9469"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.0/rtx-brew-v1.29.0-macos-arm64.tar.xz"
      sha256 "7bc5f8e7cefaeb48c6eda0e8e0b91a5c98268b0cfc4ea1f667ee56c0bcd8461c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.0/rtx-brew-v1.29.0-linux-arm64.tar.xz"
      sha256 "ad435c4c5169ea37d7d961a0b651e94097645656716f83ef18223f99934f1cc5"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.0/rtx-brew-v1.29.0-linux-x64.tar.xz"
      sha256 "ff5d97d742c9520b41d0eaacf3cabb7a52b783a1fed6ee8a117414feb3946e2b"
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
