class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.27"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.27/rtx-v0.1.1-alpha.27-macos-x64.tar.xz"
      sha256 "420dfcb636662c4abb9434e89a5d7941bce63e89bd4003f4fcfa49ab09b7284f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.27/rtx-v0.1.1-alpha.27-macos-arm64.tar.xz"
      sha256 "25af56b86d96d825761804fd64fd8324282e2590080c54ba0aaef9ebcb625ad7"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.27/rtx-v0.1.1-alpha.27-linux-arm64.tar.xz"
      sha256 "464f645aa05655791bab9b9abdd7b9a78bffec3e6c0b4536d0e049c929697b58"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.27/rtx-v0.1.1-alpha.27-linux-x64.tar.xz"
      sha256 "8edb21a09cb3d70efed20518c975d90236277ea81261b3cf26648ed990c857ca"

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
