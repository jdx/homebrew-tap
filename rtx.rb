class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.12.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.0/rtx-v1.12.0-macos-x64.tar.xz"
      sha256 "7c82b83aca58f2ac2ab3c6ea6a25d668a2de40c26493716c85d903bb6ee271af"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.0/rtx-v1.12.0-macos-arm64.tar.xz"
      sha256 "88b8173af51bb7b2c79f51c857c2e56dfc8c4f4bcf8990bd86965e29f62ae949"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.0/rtx-v1.12.0-linux-arm64.tar.xz"
      sha256 "b476ed15b7b51b6b9904eef3bdbdc478456f54aa7a7eac33fa5d5f67b90c93cf"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.0/rtx-v1.12.0-linux-x64.tar.xz"
      sha256 "d33c8bdf7d99fc99940394580ec2b033f0449476d162d1b911ec64e5ca20a768"

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
