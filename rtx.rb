class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.18"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.18/rtx-v0.1.1-alpha.18-macos-x64.tar.xz"
      sha256 "853d48b58a941630e9b99b685269855d4784276f0c7e6e3d211596a1939a201e"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.18/rtx-v0.1.1-alpha.18-macos-arm64.tar.xz"
      sha256 "7cd94af3a35fd9e5cda60b1b46f182212191d19600305dc1a37a925216cd2570"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.18/rtx-v0.1.1-alpha.18-linux-arm64.tar.xz"
      sha256 "9cb6ff5143a3c2c2e7f33de75d35c6e1b6d91ce098bdc29800d699a7e22b29b0"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.18/rtx-v0.1.1-alpha.18-linux-x64.tar.xz"
      sha256 "fce0d859689bf79e59bb13721bf3d1b8989068720740e0554f8c716aac22871f"

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
