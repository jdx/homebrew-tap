class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.0/rtx-brew-v1.23.0-macos-x64.tar.xz"
      sha256 "927f17e1a95003f1f81d3166e288460f1d08b0be0384708a8f267d4e2eebba3e"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.0/rtx-brew-v1.23.0-macos-arm64.tar.xz"
      sha256 "dd4b1bb270685af9248828d175f4df6a4f175cb387d02be368ffb973a55e0aef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.0/rtx-brew-v1.23.0-linux-arm64.tar.xz"
      sha256 "1bb49af598387abd4dc7a1aad569b71f24e85f478922c4cb02e57962fd964879"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.0/rtx-brew-v1.23.0-linux-x64.tar.xz"
      sha256 "1600e0e0345b98a282780cb19175b3be857efcbdbe829910f14bc30608bac45f"
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
