class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 ""

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 ""

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-arm64.tar.xz"
      sha256 "$CHIM_CHECKSUM_LINUX_ARM64"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-x64.tar.xz"
      sha256 ""

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
