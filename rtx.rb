class RTX < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/v0.1.1-alpha.1/rtx-v0.1.1-alpha.1-macos-x64.tar.xz"
      sha256 "ca97739d8bfadde861c5e9e431beb5d6c577670e06dda673edaccd204b30b31c"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/v0.1.1-alpha.1/rtx-v0.1.1-alpha.1-macos-arm64.tar.xz"
      sha256 "6590740206f5506b0966e57f01ee7e989967593c9c4f642275b9eba364600962"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/v0.1.1-alpha.1/rtx-v0.1.1-alpha.1-linux-arm64.tar.xz"
      sha256 "7c57cb7f610e55ab91abfe3e01f390b2247de2140425b699e3ed89d88f92240e"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/v0.1.1-alpha.1/rtx-v0.1.1-alpha.1-linux-x64.tar.xz"
      sha256 "e4f634795a0ce646797b40d2fe1f706720d621978bf2db976ecc974ab93ff45e"

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
