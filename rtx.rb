class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.8/rtx-v1.2.8-macos-x64.tar.xz"
      sha256 "1fa018b66e6b1e7ea0fc3c033087a8c874e930e6017b12b4061d2ba1811742ae"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.8/rtx-v1.2.8-macos-arm64.tar.xz"
      sha256 "1b98866bb801b518cf69c51dc1cc3e7bdb8022002dcde8f162bea35d078f34fe"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.8/rtx-v1.2.8-linux-arm64.tar.xz"
      sha256 "b49e168bfe52bd477484a79c12e132f23fafd09d2af4ad7c6eb4db1b87d8367f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.8/rtx-v1.2.8-linux-x64.tar.xz"
      sha256 "183ce1fadae3e5aa3fb7f1617def8d46bd7db1dad59c0cb21f76130bb7df57e9"

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
