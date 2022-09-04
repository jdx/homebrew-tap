class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 "80ecab28528256100f478ec705abddff6849f78e332bcea0de86b052bbe0dde8  ./chim-latest-macos-x64.tar.xz"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 "294c80b63fd5e4e1c0a6ef74545ae2fd5c8624784e212a72f2851d49fdb1ec6e  ./chim-latest-macos-arm64.tar.xz"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-arm64.tar.xz"
      sha256 "d9d0054e4d87f98fffc2089065d89ac8398f6f2540904e707fab38d988f60e59  ./chim-latest-linux-arm64.tar.xz"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-x64.tar.xz"
      sha256 "d877721c3adedd93a21e18a8c2bb062101b0175a1092802afe990bc4c989b8bb  ./chim-latest-linux-x64.tar.xz"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
