class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.29"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.29/rtx-v0.1.1-alpha.29-macos-x64.tar.xz"
      sha256 "095126b29171b71c4a491c9f6b16ce85000f1acb9bfcf3be1439ec1480274f16"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.29/rtx-v0.1.1-alpha.29-macos-arm64.tar.xz"
      sha256 "979ce1e36cad0ce5a3e7c728794d9f8c9fce5b05ed7c8dbc86396037a0fc0bc5"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.29/rtx-v0.1.1-alpha.29-linux-arm64.tar.xz"
      sha256 "e0d653e87c1045293da3511846e65ce285e3ed162d3c3878815ad53098228944"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.29/rtx-v0.1.1-alpha.29-linux-x64.tar.xz"
      sha256 "da99bd547835603ba818ad449926c3b668e54e1e4e3a5b96ea1d0c0076715a9c"

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
