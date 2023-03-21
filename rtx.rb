class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.25.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.6/rtx-brew-v1.25.6-macos-x64.tar.xz"
      sha256 "9d8a5bae38423c093ce43ad968d55ac6a01567247a1c16bf2d1f2ecdbbc4f2d2"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.25.6/rtx-brew-v1.25.6-macos-arm64.tar.xz"
      sha256 "cf59dfcc65236c1c8356a8495ce3a4b9219d53650cbf9abbc968129b88b6d828"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.25.6/rtx-brew-v1.25.6-linux-arm64.tar.xz"
      sha256 "074c5a2ad29b3dad7e2b2912cf819a338eb5fd9878dfd19b9888436639baf9c8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.6/rtx-brew-v1.25.6-linux-x64.tar.xz"
      sha256 "e53c09e7c7af97357ccb8647640741717cde401b48cce28c16e9f8600a07a01b"
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
