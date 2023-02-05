class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.5.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.1/rtx-v1.5.1-macos-x64.tar.xz"
      sha256 "a9de3518da4bd128e786327b049fdbe75d397f2b7377442a4da826ab796db997"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.1/rtx-v1.5.1-macos-arm64.tar.xz"
      sha256 "4e41ff0c37474019446447675f01c2f52251af42951500b48b6308c8d1df4d48"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.1/rtx-v1.5.1-linux-arm64.tar.xz"
      sha256 "6f4897989b42178a3518705d300c62ba37863485bd6e811be3d18c741f1aa92e"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.1/rtx-v1.5.1-linux-x64.tar.xz"
      sha256 "2b8e791652d25cb6d199cbedb6da68b1da75e3157b79784ceec918f9edc62c51"

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
