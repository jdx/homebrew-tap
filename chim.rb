class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 "54b9bfb596be161189fc9c3138d62e306742a1ab24e2977660d66e8f6e1a4eaa"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 "0920a9bf0f377dc22448c2b9d675f18b7f445af44eb21879fca4506685842d67"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-arm64.tar.xz"
      sha256 "d58b34a56d91f44638128f01d078d71bbf94c95dbce419985e7d7f796e03568b"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-x64.tar.xz"
      sha256 "9a5a07afda5dae2b748750b957eecced47a9308b22aa93669fbfb09e44dd4e59"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
