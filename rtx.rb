class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.5.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.2/rtx-v1.5.2-macos-x64.tar.xz"
      sha256 "7f90c7bb35a09a799014df63a18741796111d353e17a3c75defb421ba10f3a47"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.2/rtx-v1.5.2-macos-arm64.tar.xz"
      sha256 "8efdf5c930156ce1b2c6e551af1f7694ff7ce9bac0b9cdcfe57b19d8444b464b"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.2/rtx-v1.5.2-linux-arm64.tar.xz"
      sha256 "bd1d1a43e12ee5606698fdb08a93eb1a4078f5b9c82d031c7c07d64f65bfa8a6"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.5.2/rtx-v1.5.2-linux-x64.tar.xz"
      sha256 "62d0d60d6e50086f25c85c8f4a5c9dc6bd3e03a45ad24f3fdb8f32ba42bc73de"

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
