class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.37"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.37/rtx-v0.1.1-alpha.37-macos-x64.tar.xz"
      sha256 "6a0706836be940ea5a051e5f7632493d2d5d393bfb06be51c0b3d2b9fe653dc7"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.37/rtx-v0.1.1-alpha.37-macos-arm64.tar.xz"
      sha256 "a258e260a5fc191f5ddbfa375f42772818a8166fc1896396484b771c87a1381b"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.37/rtx-v0.1.1-alpha.37-linux-arm64.tar.xz"
      sha256 "dfbb3086ad28544761a992ec19d8cb3004964084fc5b7e9dfc4c8209ae3cd994"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.37/rtx-v0.1.1-alpha.37-linux-x64.tar.xz"
      sha256 "e5758924ea4ac0631539d4101dd277ecd8acfcb290a6e7fe206095420087a6b1"

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
