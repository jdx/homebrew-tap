class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.0/rtx-v1.0.0-macos-x64.tar.xz"
      sha256 "46d465f9f02cb9db7eaadb8e83a5cb31ee808932ecbcab193796a627ac83a2e4"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.0/rtx-v1.0.0-macos-arm64.tar.xz"
      sha256 "768c7034aa9e71ffaa0dae4aeda6d6afba3d9faf7f4883036f516461d1eb3e3f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.0/rtx-v1.0.0-linux-arm64.tar.xz"
      sha256 "1de73f62d9d9c09e01cd6422e799dd709f0d4e26a340cf0c30c6fdf86f52ea97"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.0.0/rtx-v1.0.0-linux-x64.tar.xz"
      sha256 "1e66b8310bf5661f03bde0e75b4af9ab1a114819247f9c90c76d8a871f955fce"

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
