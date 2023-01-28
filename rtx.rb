class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.2/rtx-v1.2.2-macos-x64.tar.xz"
      sha256 "6ab7bc1786e11ceb20bda92716291bf4e51613f9ddb006225b07f0fdd5b3a4fb"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.2/rtx-v1.2.2-macos-arm64.tar.xz"
      sha256 "838374b1f3830029039c07c49bf2a2b24be3710a3d450942a59d16b655061b9e"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.2/rtx-v1.2.2-linux-arm64.tar.xz"
      sha256 "96609bbb14ecc043e02ebcc6ee251a6eb30617b17704e411d12f5e73ef4d6232"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.2/rtx-v1.2.2-linux-x64.tar.xz"
      sha256 "624b87df0feb17a8046250121f1bb11cde671a4d3bc7c9fababc450d8d365e5e"

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
