class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.26"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.26/rtx-v0.1.1-alpha.26-macos-x64.tar.xz"
      sha256 "8053b3b460bacb50b336aa0bb3de4282281b8a278a4543ce8d8176375567e037"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.26/rtx-v0.1.1-alpha.26-macos-arm64.tar.xz"
      sha256 "149c123f642bf4ede01e532085fe13ef322e5cb3be1ef7efe5cf8a97cd3226c1"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.26/rtx-v0.1.1-alpha.26-linux-arm64.tar.xz"
      sha256 "39099e9145004e7ce11078fb5ff2acac4a43941ee6761a3d9ee3b815a36e419b"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.26/rtx-v0.1.1-alpha.26-linux-x64.tar.xz"
      sha256 "6bf6924f3b155e8e34ee661fd5b4b8332f42370c3f77de793e6f34ad07fc3ab8"

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
