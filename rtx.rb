class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.0/rtx-v1.5.0-macos-x64.tar.xz"
      sha256 "b19120fda33090befad288962e0b51f79d34fc1d002a7152229a719a27b80337"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.0/rtx-v1.5.0-macos-arm64.tar.xz"
      sha256 "c1b7cf0c020e214d42df468aba86eb27afda04438e95346ba30b38833f91d7b2"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.0/rtx-v1.5.0-linux-arm64.tar.xz"
      sha256 "908ec8d3fed71e5c00b6dcf42ff6d3c590f90b5e9edfd1020273d73d6bb9d5c5"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.0/rtx-v1.5.0-linux-x64.tar.xz"
      sha256 "380a44d893eea5d7a2ad1a1669ceb3ce980d5dcdd3d87a60bc3a4fa76b1a2843"

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
