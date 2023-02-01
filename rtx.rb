class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.0/rtx-v1.3.0-macos-x64.tar.xz"
      sha256 "777417e6bb1e0b6d245c8f9d3d20fa2794cceda54b5edd01d5b5fc90a6c914af"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.0/rtx-v1.3.0-macos-arm64.tar.xz"
      sha256 "750559937f5ac01edd5b2dc568a99188c5e0e75439a8ca31880b4958ca316e4b"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.0/rtx-v1.3.0-linux-arm64.tar.xz"
      sha256 "70fc8e8c60c22fae29d66fed8503f4cc1f67d964bd750a2760eebe74b1dd3b1f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.3.0/rtx-v1.3.0-linux-x64.tar.xz"
      sha256 "45217e547f7ec3b2b653a00b17faa367287a8340e3cecd8de9b16c9e191fe887"

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
