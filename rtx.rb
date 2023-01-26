class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.34"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.34/rtx-v0.1.1-alpha.34-macos-x64.tar.xz"
      sha256 "5c7dba649bb5bd2502c5f43156dfda5a9f45823171f7829749351857918d6f4a"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.34/rtx-v0.1.1-alpha.34-macos-arm64.tar.xz"
      sha256 "8de942f18eb1afbe3d83e3df10bc2396a21d21347f5624f335335fd0f148aef1"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.34/rtx-v0.1.1-alpha.34-linux-arm64.tar.xz"
      sha256 "4334245c2c95658bd2a25f9d71fe3943f53a6d687b49bfce91596ef752cdca36"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.34/rtx-v0.1.1-alpha.34-linux-x64.tar.xz"
      sha256 "a73b5aae8c891a2ccd4ee0f45173ccf85adcf610f6fb4b1f67386786f13cb737"

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
