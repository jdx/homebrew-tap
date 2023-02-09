class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.0/rtx-v1.6.0-macos-x64.tar.xz"
      sha256 "e31f99a6890401cfb859a496c5263f74297857a8f1bb3f00cfb5cee091ff8a64"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.0/rtx-v1.6.0-macos-arm64.tar.xz"
      sha256 "c839cec09f8364522c26cc4edf656f717612afab3362d71b65d9af05dbb3ecb3"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.0/rtx-v1.6.0-linux-arm64.tar.xz"
      sha256 "08e5cfd568ab24d4e91dfaf57cd677172a3882912a7c85cbacb50559ae3f4ffd"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.0/rtx-v1.6.0-linux-x64.tar.xz"
      sha256 "ef51f777712ad667ea0da4f0ffd34d80e598556399bc9d520717fbabf51bcce2"

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
