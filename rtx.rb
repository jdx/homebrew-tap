class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.13.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.13.0/rtx-v1.13.0-macos-x64.tar.xz"
      sha256 "9e83090a2c5336ef31d6d8432f20c88c28015a63a4703f02af39ba647f833202"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.13.0/rtx-v1.13.0-macos-arm64.tar.xz"
      sha256 "70f5b18513894ddbb4583afb775d5cc479b14f9b8d35b40de2030f56339b5296"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.13.0/rtx-v1.13.0-linux-arm64.tar.xz"
      sha256 "d9476c04e4c510a033b970d4cf75cf3924a440e5abf505fa5701d132a0ed46ae"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.13.0/rtx-v1.13.0-linux-x64.tar.xz"
      sha256 "d34ac00439b9b86374e4b5ef5374481c3a4bb6f1e3fe3f6cba230e84652579ab"

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
