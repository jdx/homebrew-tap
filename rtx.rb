class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.3.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.2/rtx-v1.3.2-macos-x64.tar.xz"
      sha256 "06c8dff81694d7ef0d9188d0f3433f67b9644bd2b1ddfd35eb0f558a03a00106"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.2/rtx-v1.3.2-macos-arm64.tar.xz"
      sha256 "45f00bb19b304c2201d5ddeeff3b2e5ad6fdc04853a13aa85d09244ac0c7060d"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.2/rtx-v1.3.2-linux-arm64.tar.xz"
      sha256 "a02557ff5e5a479b23662489f98fcf4038371e9562c449e33b2f7bebe66af88b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.2/rtx-v1.3.2-linux-x64.tar.xz"
      sha256 "1afa228da4b23c619ed74d0f9409899725ab781ff1d94b060c9587c5ce2d7622"

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
