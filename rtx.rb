class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.20.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.0/rtx-brew-v1.20.0-macos-x64.tar.xz"
      sha256 "fdff683922bf361e4683768416cf56696ed77feaedbbce8b02dc34ce8b38aa91"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.20.0/rtx-brew-v1.20.0-macos-arm64.tar.xz"
      sha256 "4b899cc380c98c4c4c392025a93ed6e804264cc29d3c604f71cc5c01a1e45680"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.20.0/rtx-brew-v1.20.0-linux-arm64.tar.xz"
      sha256 "1a491812c1bfefd4c2c151300dfcdb214dc0cd8a6f777150ec97512a0ecfc9e2"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.0/rtx-brew-v1.20.0-linux-x64.tar.xz"
      sha256 "debe7f705f054a570cac694dc0f8ec4854c4b7f0c1b05bdcf95183961b477124"
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
