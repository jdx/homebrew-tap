class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.0/rtx-v1.2.0-macos-x64.tar.xz"
      sha256 "22bda2fc2b13967265971342a289053e53e95add42a97317d6d2467f6ff099e5"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.0/rtx-v1.2.0-macos-arm64.tar.xz"
      sha256 "115c85b63d9501f452b27ccdfbc9a7014e2d640f1707eb7c56cf2b83e4a92af7"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.0/rtx-v1.2.0-linux-arm64.tar.xz"
      sha256 "9d020e42ad6d037031a5f3720a212c98d9833598897d355462e47f3d2034e2ce"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.0/rtx-v1.2.0-linux-x64.tar.xz"
      sha256 "cad4b0aa784db2b32b182e2cc7b5afeb0b9c1b27adf1050f46b3a2d0edc5ce41"

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
