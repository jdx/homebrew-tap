class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.36"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.36/rtx-v0.1.1-alpha.36-macos-x64.tar.xz"
      sha256 "e32ddb58e76ee61c0656e834ddc6b10648ffca66c89c49b386e7ebef7d780310"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.36/rtx-v0.1.1-alpha.36-macos-arm64.tar.xz"
      sha256 "413f8a9a53664c3d85c64787fb4753d6d1e20a661e4f8a8559ada57b9ab84871"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.36/rtx-v0.1.1-alpha.36-linux-arm64.tar.xz"
      sha256 "77113f513183ebe89b94b38656fcaa79c0bf283d48d799913f1674b90becaa82"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.36/rtx-v0.1.1-alpha.36-linux-x64.tar.xz"
      sha256 "3a36a8dcfcacc84e9a7def6ecf835d5fcc2ea20a9523e4e9a078f0d9ba66b445"

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
