class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.0/rtx-v1.1.0-macos-x64.tar.xz"
      sha256 "1e6d70c6ad58a2b19040e12fd3b8528db28c77182cfd814eeda6c4bdb61a5d48"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.0/rtx-v1.1.0-macos-arm64.tar.xz"
      sha256 "f4d2f850c8798790282d0246591e33414b1c3ab478a688d7174ddcc907703976"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.0/rtx-v1.1.0-linux-arm64.tar.xz"
      sha256 "a09a3e6c8a4ef9c413d880494cde2c719ed83883cb0aa9e305eb18209d873def"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.0/rtx-v1.1.0-linux-x64.tar.xz"
      sha256 "e5128174586f1ab82cf12b1846630e040f3564f183352a673d065c96bdf35195"

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
