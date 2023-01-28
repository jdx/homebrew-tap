class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.3/rtx-v1.2.3-macos-x64.tar.xz"
      sha256 "021ba4f26bfb4c08054627d297daeefe954c1146a1c5916f643ed9001460003d"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.3/rtx-v1.2.3-macos-arm64.tar.xz"
      sha256 "e406e273a80e8d73b2b7823b7f87968b7de9b52da736a28f92463247188615ff"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.3/rtx-v1.2.3-linux-arm64.tar.xz"
      sha256 "8c28c52562c5ab27935194d8de3a194b1c9f6eb0ffaf7e8962c52b1c6d6983f2"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.3/rtx-v1.2.3-linux-x64.tar.xz"
      sha256 "6e06cc49404e86f52fb7409934d3cf64dc1c3e28073bfb243619a3d65739dc5c"

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
