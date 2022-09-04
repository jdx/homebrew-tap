class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.0.0-test20"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 "07ff90f86e7a626dd95564ac56076a267901e97d06004a4934036d3a417d931c"

      def install
        bin.install "chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 "07ff90f86e7a626dd95564ac56076a267901e97d06004a4934036d3a417d931c"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Linux_arm64.tar.gz"
      sha256 "b27bb95e463cfc785eb7c91d47e678672798407bf92f635426ca83ac425b98e0"

      def install
        bin.install "chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Linux_x86_64.tar.gz"
      sha256 "edccde520ca0e87de6889dc80b08f737285483add4b275c4127970597540abef"

      def install
        bin.install "chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
