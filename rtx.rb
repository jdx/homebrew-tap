class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.25.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.0/rtx-brew-v1.25.0-macos-x64.tar.xz"
      sha256 "f2c93eb536830e6e0a4c9119663e950e86693f8c72cb0be29741c1aa7bfdd254"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.25.0/rtx-brew-v1.25.0-macos-arm64.tar.xz"
      sha256 "128d73b208d148b08072e182f0010e829662da62474ade42ce1f1d59be56b9b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.25.0/rtx-brew-v1.25.0-linux-arm64.tar.xz"
      sha256 "bcb4ea97b4a070b83e37e7542a4eea627ae509875d58332d68e5a6d3c3466246"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.0/rtx-brew-v1.25.0-linux-x64.tar.xz"
      sha256 "057f7b2cdaa7ab778a792f79c970445202719b8489b8742629375869cbfc25b3"
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
