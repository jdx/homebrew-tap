class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.11.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.0/rtx-v1.11.0-macos-x64.tar.xz"
      sha256 "8ea8a7c2084029fcfea5fd9880157c54c669fd5aab27d7646cada4ef835c4cc0"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.0/rtx-v1.11.0-macos-arm64.tar.xz"
      sha256 "cf801da45c03b55767c6672ef09f83baddb9b548ff52135bd2c03e25633a3997"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.0/rtx-v1.11.0-linux-arm64.tar.xz"
      sha256 "0d938e37ec1cc3d7d76940d24a5ddf930d9edd9260a96cd7e6e5cd35878e79b0"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.0/rtx-v1.11.0-linux-x64.tar.xz"
      sha256 "fd57d657c3f21084ed1fd7ab37971f503f5f30830e692899ea6b8f84a330263f"

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
