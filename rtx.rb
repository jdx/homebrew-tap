class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.0/rtx-v1.10.0-macos-x64.tar.xz"
      sha256 "159dda0a50d1fcd020e9c6ef4d2985977fbae5efd23674667e7473d623c74ebc"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.0/rtx-v1.10.0-macos-arm64.tar.xz"
      sha256 "b2d2010602e60820e483bdb9cc73635213103f090d9490ee565e352ad44418ff"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.0/rtx-v1.10.0-linux-arm64.tar.xz"
      sha256 "ab3a162d8c9c851dc7a2b53df67313c49ccb19b0b908d6540e9c8f0551a1dcc6"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.0/rtx-v1.10.0-linux-x64.tar.xz"
      sha256 "0bbc27c12ae57c7d510d261626fecc20d7e0e99d5e94bef98a19e23fab06cdd3"

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
