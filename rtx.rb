class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.18.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.2/rtx-brew-v1.18.2-macos-x64.tar.xz"
      sha256 "dd3bc31c8c0f51d1515b3bba3b6e3a5b973a177b6568e6e450ef7015a8853cda"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.18.2/rtx-brew-v1.18.2-macos-arm64.tar.xz"
      sha256 "2751888b09975bb8699d757dfdf6018e23c0cf74ed580e0d445efb5788678c49"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.18.2/rtx-brew-v1.18.2-linux-arm64.tar.xz"
      sha256 "574fb567e68091f1b1adf18ce8f139efb4a119cdc71fdda0e74dc90891162dcc"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.2/rtx-brew-v1.18.2-linux-x64.tar.xz"
      sha256 "9fb5f6d606d768ffc22e28c64c84760ae395a91461125903e5016316332f889d"
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
