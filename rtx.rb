class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.1/rtx-v1.1.1-macos-x64.tar.xz"
      sha256 "a2bb40b4f59375c7970d4aba9913cd42e1ecbad214ab6e639e561a9eae1eb5c6"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.1/rtx-v1.1.1-macos-arm64.tar.xz"
      sha256 "a5cf190ffdc4fd3f00c64d6e9b9d5668c2eb8c99d95569fb60f664bded0c892a"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.1/rtx-v1.1.1-linux-arm64.tar.xz"
      sha256 "305b8e1c106c388ec5bc39dc9514aa92cb113ec5f35b78b9ed2daa909a1af515"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.1.1/rtx-v1.1.1-linux-x64.tar.xz"
      sha256 "687c864ea13f21ec42d05e21aa5292987a3d10899730b9b10468efb148c91617"

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
