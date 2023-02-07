class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.5.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.3/rtx-v1.5.3-macos-x64.tar.xz"
      sha256 "0cfb734ebbf869b17923b30c9438135e859ca0bfe9d6d4a6c850753ebcdcb3e7"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.3/rtx-v1.5.3-macos-arm64.tar.xz"
      sha256 "55c79a67b9853b89d3b8005705861fcbceeed308f579b5f997649c81526307fe"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.3/rtx-v1.5.3-linux-arm64.tar.xz"
      sha256 "28e955d04a6ba007eb777971d4e5ff76554f73f4185848890959c9350a6a2842"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.3/rtx-v1.5.3-linux-x64.tar.xz"
      sha256 "f102fc106de45236959395f45f0c53eb46c7ec08385b8d959cb9095fea6df32c"

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
