class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.38"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.38/rtx-v0.1.1-alpha.38-macos-x64.tar.xz"
      sha256 "5b1f8d0b06834f4300a829c7832720f9ace15139c6ec052dda6c4ada58ce7166"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.38/rtx-v0.1.1-alpha.38-macos-arm64.tar.xz"
      sha256 "bdea0bd3b12d0b47572623337d98182f79db613a680960707b4ff81e1fedfb89"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.38/rtx-v0.1.1-alpha.38-linux-arm64.tar.xz"
      sha256 "e68de9a81a64f3916da13428dbfb82ffbf9e65a0fce40ca2cb3e62fb6b611320"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.38/rtx-v0.1.1-alpha.38-linux-x64.tar.xz"
      sha256 "ffc841cf08c9089440e27e58f877acd9ff53eda0d321ca6026ab878ebb50ef39"

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
