class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.1/rtx-v0.0.0-alpha.1-macos-x64.tar.xz"
      sha256 "c23fd109f58258656ea8f5dd0d1edb0bb6b4c34d8ad7564bad5a5ac130c3c034"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.1/rtx-v0.0.0-alpha.1-macos-arm64.tar.xz"
      sha256 "d1d6b648be33bc748fc8e662604d45ddb4faef1e1322b2a2a95811b121025761"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.1/rtx-v0.0.0-alpha.1-linux-arm64.tar.xz"
      sha256 "9ceab2c892b725d1c354bfba7f4f33435bfe59fa5f1da1de0ba5b7c1badda33c"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.1/rtx-v0.0.0-alpha.1-linux-x64.tar.xz"
      sha256 "aa955fd27d2b4d256c88f4929061c009517481f1a2e4855f2799c99090ed88f7"

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
