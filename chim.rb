class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 "fe8630501a1b198926f678946d3146ffd85719f3fe44cfc2e2e2698ed7956ff7"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 "454346b0b270f2d9083dc710f5e4249c805d960660f2c4c0871b6d2a14d4e1fc"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-arm64.tar.xz"
      sha256 "c9a1e0693f27dc9ff2a718cbb477ca15b1f2da2a3dba09fd160f3a249a702383"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-x64.tar.xz"
      sha256 "f7092272d057d66b643aecb575f2028df11b963b249bc33b82722997674ffbce"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
