class RTX < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/v0.1.0/rtx-v0.1.0-macos-x64.tar.xz"
      sha256 "4d6e1caea564160b08811fedb1fec36bd5bedc6803bb6f6e5d72865b35e1633c"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/v0.1.0/rtx-v0.1.0-macos-arm64.tar.xz"
      sha256 "325e7021e32b8a682d3b81c8274575197eba3f83d460264e42e886f716f700fd"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/v0.1.0/rtx-v0.1.0-linux-arm64.tar.xz"
      sha256 "6b458aa4183778a316e031f663d896878c30a793b0fd9f33889297e9ecb56278"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/v0.1.0/rtx-v0.1.0-linux-x64.tar.xz"
      sha256 "703f9151b127ee4fac3afced943c0e5e38df842a4aef438949bd3443a0bbbb4b"

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
