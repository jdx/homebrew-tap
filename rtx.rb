class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.6/rtx-v0.0.0-alpha.6-macos-x64.tar.xz"
      sha256 "52fc69b7bf2571a5bc44edbd88ff333a5b92142e4f1eb7fdb518be1075103d70"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.6/rtx-v0.0.0-alpha.6-macos-arm64.tar.xz"
      sha256 "356fc49421f7efd0c2a0f7c545920d0bc51bed565edfe5a3c247c13d07d3a5f1"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.6/rtx-v0.0.0-alpha.6-linux-arm64.tar.xz"
      sha256 "3e55cdf64f13dfacdc852c3c125b0e73c9127eb31229c7208016b6438fd7ad83"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.6/rtx-v0.0.0-alpha.6-linux-x64.tar.xz"
      sha256 "ae26279e4faf93b8e74f3c99a8fa1599afb00d72b67a2731af5fcaffe7a79e6c"

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
