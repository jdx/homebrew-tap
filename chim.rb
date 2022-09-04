class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-x64.tar.xz"
      sha256 "d7b624e5e4a82a4010efb63321f3ebd6f9550ba45a686f220c01c6c3ddf79825"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-macos-arm64.tar.xz"
      sha256 "f3a0c6599bceaaf7a2f0d466c6530cff9ec844998f10e24da5058615a49657dc"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-arm64.tar.xz"
      sha256 "d872605cc4f258f71924e3553994b4e81084cf89093c653100a30cc738afeee1"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v0.1.0-beta.1/chim-v0.1.0-beta.1-linux-x64.tar.xz"
      sha256 "b4bc464a8ee44f1a497d2f452fdb1c18794fb46b7f4f7e3431dca4002c169e43"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
  end
end
