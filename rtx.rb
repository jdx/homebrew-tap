class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.14.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.2/rtx-v1.14.2-macos-x64.tar.xz"
      sha256 "d9c1a8742931ef51401d5383e7f447974100cdd667be7844ba5c231dc9c36c4b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.2/rtx-v1.14.2-macos-arm64.tar.xz"
      sha256 "2a9dab3c0ffe49d38785df6dc251a81a8267ac54b97950e3a1bf5778a8b455a4"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.2/rtx-v1.14.2-linux-arm64.tar.xz"
      sha256 "bbc70851b8728a10917bfb4d7967bd4993e13b3b6f98d0003146119bf738c7a7"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.2/rtx-v1.14.2-linux-x64.tar.xz"
      sha256 "e533039aa591a86c53ca10329c73e04917e4a63b8b859c1106421863e062bb75"

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
