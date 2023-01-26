class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.30"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.30/rtx-v0.1.1-alpha.30-macos-x64.tar.xz"
      sha256 "becec29176b8381f133e6619576baa74259aef13bb9522f975273619489c189f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.30/rtx-v0.1.1-alpha.30-macos-arm64.tar.xz"
      sha256 "fd5e7e2327f223553afb90368c17942b802afddf372c086749c1398e0df69d7d"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.30/rtx-v0.1.1-alpha.30-linux-arm64.tar.xz"
      sha256 "45dab104066a145fa89f9411e7f6e8210f1eb13afef1d36a989082a39f098476"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.30/rtx-v0.1.1-alpha.30-linux-x64.tar.xz"
      sha256 "d58f677395860ed3da29b4c37a4ce534f0f3cbf883252fc4e139c1cfb4cb2986"

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
