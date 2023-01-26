class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.31"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.31/rtx-v0.1.1-alpha.31-macos-x64.tar.xz"
      sha256 "30f08b1ab77269075b8e22671cf6814419811093e35e41733f612c5db3e90b64"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.31/rtx-v0.1.1-alpha.31-macos-arm64.tar.xz"
      sha256 "640eaf4552bf688014bb8b173eb1f20e2500c417b3a9f926721a8f05644a78d5"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.31/rtx-v0.1.1-alpha.31-linux-arm64.tar.xz"
      sha256 "92e9af9dd5b2f9a1b85d23c67f9c16c45fc1add32f8aefc2874d22353cf4effa"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.31/rtx-v0.1.1-alpha.31-linux-x64.tar.xz"
      sha256 "2b14c76eb1da514700ed7867c8627fa057db1e7c5d8b87c92d879f4825c70b37"

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
