class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.15.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.4/rtx-brew-v1.15.4-macos-x64.tar.xz"
      sha256 "62099a6a6531795299361a161c50098d48d9b0dcb0ffb8ed97e7b2907458d847"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.4/rtx-brew-v1.15.4-macos-arm64.tar.xz"
      sha256 "a598e778bbabb399f296c0e35c04590e53e2f1783f30a2135a044a8518d38fd6"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.4/rtx-brew-v1.15.4-linux-arm64.tar.xz"
      sha256 "1d16f5c5210ff7c4557960d0624de8f4ae0f4257ecb3868f6889a80b98dd4165"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.4/rtx-brew-v1.15.4-linux-x64.tar.xz"
      sha256 "e26275acc86f1a9fbca944baf8c612e348472117838072f3f3f858a30cb2418e"

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
