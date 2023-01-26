class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.32"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.32/rtx-v0.1.1-alpha.32-macos-x64.tar.xz"
      sha256 "39d59084f78f4cfaae22175cc8b311d381dee2b4ea9de352f2567c743ec2352f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.32/rtx-v0.1.1-alpha.32-macos-arm64.tar.xz"
      sha256 "1c1a63dbb15f5b6afaea46d8c6cdda46122df8b3c73d9c5f531eefc5c7bbfff2"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.32/rtx-v0.1.1-alpha.32-linux-arm64.tar.xz"
      sha256 "9c606a20dbe7be84546655325ef7a8d944df07fdbb77faa655705366b59ec50d"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.32/rtx-v0.1.1-alpha.32-linux-x64.tar.xz"
      sha256 "d4fc974237ab3b12113819d68e815159a9832b1ed12c6db21e4b0a1c1f8b5a66"

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
