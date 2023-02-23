class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.15.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.1/rtx-brew-v1.15.1-macos-x64.tar.xz"
      sha256 "5990990960ec12a976a9872ff55033f28741f0da2f1f3ef3074c0e408583b859"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.1/rtx-brew-v1.15.1-macos-arm64.tar.xz"
      sha256 "26ca6ca233f4761884f8b83e8a67754b6e2c2c3930836dcb9e91a1a014516bdc"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.1/rtx-brew-v1.15.1-linux-arm64.tar.xz"
      sha256 "82b41061fb3a47cf77873657eb4a28d3600e4873b6e714779cd27f82e8a517ba"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.1/rtx-brew-v1.15.1-linux-x64.tar.xz"
      sha256 "169b2debb9b34c39e9fa68a23ad487932b0f13edf5a88dca890a67431cc76d83"

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
