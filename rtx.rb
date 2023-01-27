class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.1/rtx-v1.0.1-macos-x64.tar.xz"
      sha256 "f47a794c1fd5d1ae631cd973556c9e82da8cf8336dc5fa074f3bed62b33b755c"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.1/rtx-v1.0.1-macos-arm64.tar.xz"
      sha256 "653b57422b96dace354f687507790a2f4d2df025aa8adec8e68b9c8c9a660326"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.1/rtx-v1.0.1-linux-arm64.tar.xz"
      sha256 "bed5c742da0814f564f0f099021a30aa66430e4e6f5f8900d23923b97bc4a854"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.1/rtx-v1.0.1-linux-x64.tar.xz"
      sha256 "1c310bd79031bcbf1de4e2e0c763421bd5352f0e30544fe5ac53ccfe006d7035"

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
