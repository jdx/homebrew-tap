class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.16.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.1/rtx-brew-v1.16.1-macos-x64.tar.xz"
      sha256 "eb0a88531d1002ca6fbad304357a859ad17ef0f370ac97cf93fad3ee3a028532"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.1/rtx-brew-v1.16.1-macos-arm64.tar.xz"
      sha256 "4f4ea23628e0dbd797fe1885b50e5bcf697064de255bdf8218bd61c649f41ace"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.1/rtx-brew-v1.16.1-linux-arm64.tar.xz"
      sha256 "426579048986835ef13856fb2cf36f4b66f8420750966a1d2a90cbc410a78313"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.16.1/rtx-brew-v1.16.1-linux-x64.tar.xz"
      sha256 "798e1a085a5eea25f5992c1f43d31000b6acb4361c90e4f863ecedc856afa75e"

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
