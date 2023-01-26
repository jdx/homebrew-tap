class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.28"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.28/rtx-v0.1.1-alpha.28-macos-x64.tar.xz"
      sha256 "3aa715d6b9a61baa50133c6883da9f79eb26afa54ab1bae463fee4af1745cbb8"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.28/rtx-v0.1.1-alpha.28-macos-arm64.tar.xz"
      sha256 "9a91d3a63d219d19729cf3d9c3592d51e8e650cb5105fd9ed1eec8bf64aeb70f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.28/rtx-v0.1.1-alpha.28-linux-arm64.tar.xz"
      sha256 "e4078d90d52dced0688291877fa1408baa34774fe4e11a242dffa6929e5aca23"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.28/rtx-v0.1.1-alpha.28-linux-x64.tar.xz"
      sha256 "7f128fbcf2f404ae21fbb050b2be048df97c355e7507f1b717f54d0ee049692b"

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
