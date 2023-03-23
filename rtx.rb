class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.26.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.2/rtx-brew-v1.26.2-macos-x64.tar.xz"
      sha256 "9c3ca0745380db1846e010b46e16e3210406b2005420d001ee064244df4a2321"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.26.2/rtx-brew-v1.26.2-macos-arm64.tar.xz"
      sha256 "177dc125006149e75c27fd647dd26965d61e719ce7f4264ded322ebc0f158d6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.26.2/rtx-brew-v1.26.2-linux-arm64.tar.xz"
      sha256 "bbe52ad139f168a5fd80375cb31cb8c7699062cfbf3fd7667d97edde1dc40360"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.2/rtx-brew-v1.26.2-linux-x64.tar.xz"
      sha256 "c24ef5999a2d813fb98525b053aab7c9f1269328eb6a8e95df62b60da117643b"
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
