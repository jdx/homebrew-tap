class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.6/rtx-v1.2.6-macos-x64.tar.xz"
      sha256 "63860f1d1418cf75a6607498dc0230ffb0793ff963bf574ffb84961395d35b7f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.6/rtx-v1.2.6-macos-arm64.tar.xz"
      sha256 "9dc116c85ddd8d550e1e2499e781cf2d58cfcc5ad0ccdf8433e0f7714ae719f1"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.6/rtx-v1.2.6-linux-arm64.tar.xz"
      sha256 "da00fef7eaaf60d81360f70259cd32be2b58b437f155edf51b6ea6f380000edb"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.6/rtx-v1.2.6-linux-x64.tar.xz"
      sha256 "b140dcd6d8cbcef4f637df6b25bcff69783802fa51028069932b340c44b78616"

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
