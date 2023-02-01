class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.9/rtx-v1.2.9-macos-x64.tar.xz"
      sha256 "788d38faf29ba4c995f2e92771f6a6676f5e172337a13a7e4300d9dfde330241"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.9/rtx-v1.2.9-macos-arm64.tar.xz"
      sha256 "a925be97442df06a4c86aad6a78a16133fd001a64db7ded08665127ca15b3078"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.9/rtx-v1.2.9-linux-arm64.tar.xz"
      sha256 "639916cedef7906a08ddbbf7f7151d2b0a0d4196063e060c89c9e7d3832a64a0"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.9/rtx-v1.2.9-linux-x64.tar.xz"
      sha256 "72b9ae0122ac9253ee4bf8b583fc1dd883c5f784e7ee0d50ebf50da31c81d436"

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
