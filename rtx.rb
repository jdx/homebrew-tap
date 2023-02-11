class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.7.0/rtx-v1.7.0-macos-x64.tar.xz"
      sha256 "24ed48f68a67201b4238e9346c34141b59ceb4975e75b85d36f66bee9ff2849a"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.7.0/rtx-v1.7.0-macos-arm64.tar.xz"
      sha256 "144de0c7044b87ad7f989634fb1d1ba4685813f4726e8fef02fbaa19646b3fac"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.7.0/rtx-v1.7.0-linux-arm64.tar.xz"
      sha256 "4dcc8a0ac5a679b0b26e0a125651a7c1f71d0b314bb28a18659aa74ab00b6d88"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.7.0/rtx-v1.7.0-linux-x64.tar.xz"
      sha256 "614c65a5f427db709373de8f3c319204449d4b639e80ca2c97ca3b6efdc6e69c"

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
