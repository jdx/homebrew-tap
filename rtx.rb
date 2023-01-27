class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.5/rtx-v0.0.0-alpha.5-macos-x64.tar.xz"
      sha256 "335e4e26c83393eac195ecb860c04079b6975025879dc325ced2bda9022d3dc7"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.5/rtx-v0.0.0-alpha.5-macos-arm64.tar.xz"
      sha256 "cd733ff31ed384507662bf86a20cf2a76fd00cb411ead6365978e0189f44f0ef"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.5/rtx-v0.0.0-alpha.5-linux-arm64.tar.xz"
      sha256 "4e83b0fc7bde2860755ed3a3884341052d0d85dd811c480518a03c33dea700ab"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.5/rtx-v0.0.0-alpha.5-linux-x64.tar.xz"
      sha256 "a93ec1e5d2c6aba818570b272d7f8a3c78bbe91ab161e6a21e60b2058bebe39e"

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
