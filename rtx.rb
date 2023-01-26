class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.33"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.33/rtx-v0.1.1-alpha.33-macos-x64.tar.xz"
      sha256 "25db89ad2fc9c6686f81e2745b0018c9cd46737e640d6f338a680f216f47b4f8"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.33/rtx-v0.1.1-alpha.33-macos-arm64.tar.xz"
      sha256 "b1b53eea05205c21fdecc40c3a4da0a8a3384924e4a151c3af5c08d8cee0d808"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.33/rtx-v0.1.1-alpha.33-linux-arm64.tar.xz"
      sha256 "94092ac53b237225f87f544de182d6b039c2436f0eac0876fc6ef53bcd6d0eff"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.33/rtx-v0.1.1-alpha.33-linux-x64.tar.xz"
      sha256 "ad80650a203e63f70c6399498bfe8f95e3585121d5ab213ade31cca4f7851019"

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
