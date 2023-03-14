class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.6/rtx-brew-v1.23.6-macos-x64.tar.xz"
      sha256 "d32daf60428b2325e4ee4dcecee67c36963af16220349141ed10e8c48722322c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.6/rtx-brew-v1.23.6-macos-arm64.tar.xz"
      sha256 "efb50af91a2e0ed3690691b5bd461f2648a2c6836c5481a1467ade6796448346"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.6/rtx-brew-v1.23.6-linux-arm64.tar.xz"
      sha256 "8f34f272e421986b9b96c7a230627f86dda206e52f3165a11364619a2f6d6148"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.6/rtx-brew-v1.23.6-linux-x64.tar.xz"
      sha256 "95363d2f02c05ae58f00b13463b17f37a340418c7772c474a6e667fa911d5d3e"
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
