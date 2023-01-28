class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.4/rtx-v1.2.4-macos-x64.tar.xz"
      sha256 "99834873cb353003979d61a25d8a524a0f030409febb630dd35b8bf50997cb3f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.4/rtx-v1.2.4-macos-arm64.tar.xz"
      sha256 "a75275d74c08a9333e12dfd83b10ef71b78013a266d97b561a56836d078e9940"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.4/rtx-v1.2.4-linux-arm64.tar.xz"
      sha256 "18ffd5559a2bdebabcf7e2c95b0bf7f1d0610c0c83982cd1a2a407bbb7c7dea6"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.4/rtx-v1.2.4-linux-x64.tar.xz"
      sha256 "fffcbc1712b9aabb6f426c237ff78d539fe6a31593f1b61b9be58b3f6839cd0c"

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
