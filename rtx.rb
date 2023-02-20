class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.12.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.1/rtx-v1.12.1-macos-x64.tar.xz"
      sha256 "63babb47f381d19ae8395832098e2724449fab030cdb57cbca9f4b4a7d086002"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.1/rtx-v1.12.1-macos-arm64.tar.xz"
      sha256 "c687d0d5d8fb4ed7c8771960e8e87960ed3d62ee48ecbed708883a27fb977df8"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.1/rtx-v1.12.1-linux-arm64.tar.xz"
      sha256 "44e0db09f7a89cac188bcb52e0503bfdaccdfa6b381fb69ab259b9030917f2b5"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.12.1/rtx-v1.12.1-linux-x64.tar.xz"
      sha256 "0da84950e382be95ebd8b31f8420f256676d74db61f7fedc428d3b82f6979b4f"

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
