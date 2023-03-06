class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.3/rtx-brew-v1.22.3-macos-x64.tar.xz"
      sha256 "9c7859fdde04e65b85ea63e10091d1bf2329a600be0d6314f114aad8f121210b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.3/rtx-brew-v1.22.3-macos-arm64.tar.xz"
      sha256 "0b8bc4cb21eaa542f218e8cd6dcff21c182591e72a4083836c3877109957e84d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.3/rtx-brew-v1.22.3-linux-arm64.tar.xz"
      sha256 "dd8c044bccb17a1487d487f1c28c71a6f1d3300e455381906035baee2467b1ba"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.3/rtx-brew-v1.22.3-linux-x64.tar.xz"
      sha256 "6a09c8695a67fcc58a1e57b8d0259279e9da7c0e1d9ff7546bb17ef71d6b765b"
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
