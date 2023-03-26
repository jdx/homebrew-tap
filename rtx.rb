class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.8/rtx-brew-v1.27.8-macos-x64.tar.xz"
      sha256 "9a8620b09e822c2c5da205a89a65d93bab1b0b3d0a25f91554fc92b9a574670b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.8/rtx-brew-v1.27.8-macos-arm64.tar.xz"
      sha256 "3d53b6fbd0926d02cc3d831f654775ac77d2e5d4addb98a20f5124ad216dacbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.8/rtx-brew-v1.27.8-linux-arm64.tar.xz"
      sha256 "a62e00990a6697c2e584eba157de050b6f3d1a36019bdafd8e80321d4d67d53d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.8/rtx-brew-v1.27.8-linux-x64.tar.xz"
      sha256 "ca6c5ce96fc4ad31a5810f62483914d36d5b8b64e212902594113dcffffcfcc7"
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
