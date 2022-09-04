class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.0.2/chim-v1.0.2-macos-x64.tar.xz"
      sha256 "65d7dd811ce16e2046b4411762dbf32bfa9029857b9e07faad5d719211ae2b40"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v1.0.2/chim-v1.0.2-macos-arm64.tar.xz"
      sha256 "1cf289bb0913082dbc336ec924c4b76bc19d155934092d2e6052d8975fc1cbbe"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v1.0.2/chim-v1.0.2-linux-arm64.tar.xz"
      sha256 "c139695defca328f0913d800b12eedae21a8747c1c30fc96b9c15eb7e21ff026"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.0.2/chim-v1.0.2-linux-x64.tar.xz"
      sha256 "bc26860622efa881b9c6a65e804fad3977b9558e2e51c5c910abfd3577c299fd"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
