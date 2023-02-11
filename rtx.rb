class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.8.0/rtx-v1.8.0-macos-x64.tar.xz"
      sha256 "b10758f7a140db39aebb5fe86e288e9f2c522c16e1cc8d752f5686c6f0dbac14"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.8.0/rtx-v1.8.0-macos-arm64.tar.xz"
      sha256 "ccbb19006818dedecb97e1675d21ec3aadd78f8c932da05a11dc38b50d2fa1b2"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.8.0/rtx-v1.8.0-linux-arm64.tar.xz"
      sha256 "8e5375bda6c46ba17eb1d579c2a367d110b87101f287e2d9430da96cf4c4b879"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.8.0/rtx-v1.8.0-linux-x64.tar.xz"
      sha256 "3b5c117d49c250e660b2f8618eefe75746f9c9ec096819d740a1d0626c6e3c1d"

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
