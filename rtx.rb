class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.3/rtx-v0.0.0-alpha.3-macos-x64.tar.xz"
      sha256 "9c73971cd0bfc43388af60ca26ef2f5757c97731f16d40ffce182c234d61533f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.3/rtx-v0.0.0-alpha.3-macos-arm64.tar.xz"
      sha256 "06d1a2b9913a32a3df66cc39eb5f9cda97e4c83c53d9c9d1ba28dea6ae1cd8ca"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.3/rtx-v0.0.0-alpha.3-linux-arm64.tar.xz"
      sha256 "18ee334bf6325ecf104d775b6dfa04c43800f7cd5a133d646be4debea26d5a8b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.3/rtx-v0.0.0-alpha.3-linux-x64.tar.xz"
      sha256 "b6c12ab5a02489bf96146fa5694515b58e37a0cd1db860230b218f1d4dfc7b5f"

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
