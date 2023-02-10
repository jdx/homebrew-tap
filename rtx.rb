class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.6.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.1/rtx-v1.6.1-macos-x64.tar.xz"
      sha256 "d5b15e6ee1063c05855e8d451d6f50a5b2dcc1866aebfecd2e8a51d08ab767d7"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.1/rtx-v1.6.1-macos-arm64.tar.xz"
      sha256 "bf110f928080d7962ce51bcb29c053f280c92aeb65281837d556a8d90adba464"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.1/rtx-v1.6.1-linux-arm64.tar.xz"
      sha256 "bc9510afc6e9751439b2b6203972965d19c523f7565107ac11ee76b79a0c1cb2"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.6.1/rtx-v1.6.1-linux-x64.tar.xz"
      sha256 "5fd65da1bd7c8ae2a7510994a4bf8c4cbb9d2c50359cbcb12b80efcd48a4d584"

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
