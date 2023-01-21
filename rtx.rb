class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.17"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.17/rtx-v0.1.1-alpha.17-macos-x64.tar.xz"
      sha256 "4d7a1e1e1ca731d2e76fa33cfc1371c907874976691739ee0899f94b95845fac"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.17/rtx-v0.1.1-alpha.17-macos-arm64.tar.xz"
      sha256 "5afcc84574f8d6f996282c7d1cf32f271b5bbe6b769552633155c40d8dba8bb9"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.17/rtx-v0.1.1-alpha.17-linux-arm64.tar.xz"
      sha256 "5eee70b2d5595c515946398ec31b15c6e757b52af8ad2da99b6962cebf51d3b6"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.17/rtx-v0.1.1-alpha.17-linux-x64.tar.xz"
      sha256 "4d71945fe5568347a3f0127532fc6c57f6317b3ed1d4404b970d7365a7b46254"

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
