class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.7/rtx-v1.2.7-macos-x64.tar.xz"
      sha256 "0e08f0b927669dc106fca5100f0c037c8c15b068187503398d864d1612509422"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.7/rtx-v1.2.7-macos-arm64.tar.xz"
      sha256 "6f021a954e138a723e9e884198e07c09ac1dc90785247f980938e13bc7732fec"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.7/rtx-v1.2.7-linux-arm64.tar.xz"
      sha256 "9ab1af102e9b6218dffe1390df38a3464e6e52662d859c4b149a70de897903e3"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.7/rtx-v1.2.7-linux-x64.tar.xz"
      sha256 "7c58bb30505e3e48df26c991492afff24bdce5540e21c76af9c76c048227e251"

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
