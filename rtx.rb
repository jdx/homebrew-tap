class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.16.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.0/rtx-brew-v1.16.0-macos-x64.tar.xz"
      sha256 "fcf36034c46a1d4f15657814aa51cdfc2a7ff60fe3c41f12be66af695db428de"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.0/rtx-brew-v1.16.0-macos-arm64.tar.xz"
      sha256 "dcc73f98b728382b7e8f728762d57165cd2d1187cf658e3a80d8b9d983b81324"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.0/rtx-brew-v1.16.0-linux-arm64.tar.xz"
      sha256 "bb810700132864627a028fda6aab68fdb93a4e2ccf3491b2a15e596fae21ccb3"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.0/rtx-brew-v1.16.0-linux-x64.tar.xz"
      sha256 "e0be7ea23d75547163b7856a63bf5e126c1a835e8ad397648a2042d96d5122d2"

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
