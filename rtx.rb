class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.35"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.35/rtx-v0.1.1-alpha.35-macos-x64.tar.xz"
      sha256 "63c071e46c98799d1f2be925eda1c08101afcbf6bb9d261776c63ac218666281"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.35/rtx-v0.1.1-alpha.35-macos-arm64.tar.xz"
      sha256 "f9e89c747053db51bc580f897701bdbd88c2d1c3abe96d24b03cabd9b4c39495"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.35/rtx-v0.1.1-alpha.35-linux-arm64.tar.xz"
      sha256 "3c5c364143a7eac4e2a1e5cec8fce2c6a4ce084b9c64d0b6403685c276aac17a"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.35/rtx-v0.1.1-alpha.35-linux-x64.tar.xz"
      sha256 "ee1f374489968fd4761b4ca4472337396e1921674589fbdf034ab9d8579df45c"

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
