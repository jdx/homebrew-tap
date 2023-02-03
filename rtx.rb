class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.4.0/rtx-v1.4.0-macos-x64.tar.xz"
      sha256 "734e3699cb65a02fc9b3a6b1139d1fce2644814b31e7528ad70ba5b34a62321b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.4.0/rtx-v1.4.0-macos-arm64.tar.xz"
      sha256 "d6423529ef144a0f716a4316b2d895733c57371108b15d2d0893ce8f34033a69"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.4.0/rtx-v1.4.0-linux-arm64.tar.xz"
      sha256 "9afe4a90249897facb15d7605b671e6b9229d4be12fe223e8886d5e6fd7f0945"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.4.0/rtx-v1.4.0-linux-x64.tar.xz"
      sha256 "97e17abcfeed368b957af8c440bed6209f34893be7559acbe2df264673a8845c"

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
