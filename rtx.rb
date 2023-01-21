class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.1.1-alpha.16"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.16/rtx-v0.1.1-alpha.16-macos-x64.tar.xz"
      sha256 "40c9de0077508b2e900a7d55a70b785d8150e3a68a3cf819eea4b6d04d49f852"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.16/rtx-v0.1.1-alpha.16-macos-arm64.tar.xz"
      sha256 "a2f7eccf9442957237df0d6c9c596d326969a8ba44639b6600331db017f9265b"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.16/rtx-v0.1.1-alpha.16-linux-arm64.tar.xz"
      sha256 "cd7cd4c83bbbe3f8af34d40dd04d3afd9c3080f54061cbed2929564abbe889f3"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.1.1-alpha.16/rtx-v0.1.1-alpha.16-linux-x64.tar.xz"
      sha256 "de3861be4807fafacbfd08cc657ec777996cf81e68ec5b7995f8718392446b39"

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
