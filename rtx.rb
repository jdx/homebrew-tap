class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.14.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.1/rtx-v1.14.1-macos-x64.tar.xz"
      sha256 "a32e223bba1767bab60cc626fcd88900c2523317c60f48c35ca486f5ff7354b0"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.1/rtx-v1.14.1-macos-arm64.tar.xz"
      sha256 "f71365bce4def084b1c584ab5eaa7c6808ea239a56df7234f73dc50a6af26c66"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.1/rtx-v1.14.1-linux-arm64.tar.xz"
      sha256 "987be9570374c8dcb676d0001c22cf99e779150f1755ee81fca22ecf6d03f8fa"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.1/rtx-v1.14.1-linux-x64.tar.xz"
      sha256 "ac4d683afff12b205599032c1adc68983ad9b17e35be3eca89d1d8d28cbe6e3f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  test do
    system "#{bin}/rtx --version"
    assert_match "it works!", shell_output("#{bin}/rtx exec nodejs@18 -- node -p 'it works!'")
  end
end
