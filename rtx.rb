class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.1/rtx-v1.3.1-macos-x64.tar.xz"
      sha256 "e112e263ab62d30c4bd0d0a1b3723d742f910ab573eebb51071c575a699ea686"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.1/rtx-v1.3.1-macos-arm64.tar.xz"
      sha256 "ff75b62577a4c081a830f5d252418be7b0e833a63f30f697f32a82191679f6a2"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.1/rtx-v1.3.1-linux-arm64.tar.xz"
      sha256 "d5665a9435f079647add1e1e7d32bf0be4311933d24e82b28baed92a59e3ccae"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.1/rtx-v1.3.1-linux-x64.tar.xz"
      sha256 "2ab2fa90ab51220926c025cdfa2099116823075a11a865f463c1ea2573e1bbec"

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
