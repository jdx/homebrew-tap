class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.2/rtx-v0.0.0-alpha.2-macos-x64.tar.xz"
      sha256 "7b7cb8b3b695d1f1d1e557442364aa3c6da6a848f70326fe59560652ea09d38b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.2/rtx-v0.0.0-alpha.2-macos-arm64.tar.xz"
      sha256 "198a5c2d8fd003c90d9899b43ea94c51c0d5564f1d44444f6469c12afac65b0f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.2/rtx-v0.0.0-alpha.2-linux-arm64.tar.xz"
      sha256 "443c7e5b8cbdd78ca82fdf695c659b324845760c8756d3dd6785d33fbd9601ab"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.2/rtx-v0.0.0-alpha.2-linux-x64.tar.xz"
      sha256 "33c4b3e91e627d60a4e008350f57250556290c61e0109a4ecbd992c777500670"

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
