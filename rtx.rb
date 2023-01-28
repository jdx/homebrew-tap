class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.1/rtx-v1.2.1-macos-x64.tar.xz"
      sha256 "1dc8df65e3df9c199784961acc501963b2b76998469855b25cccaff56d889136"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.1/rtx-v1.2.1-macos-arm64.tar.xz"
      sha256 "b8883cda6702bd6cfcfd3b9cc94e47e176c2aedf2d7705a5a6c59b6dbe195b9a"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.1/rtx-v1.2.1-linux-arm64.tar.xz"
      sha256 "be4464cfec07b0ac471878dd3b5c8f15116f58e157629cdf257ddb27e9efe6d9"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.1/rtx-v1.2.1-linux-x64.tar.xz"
      sha256 "9e97bb64789b548cd52dffba7be7308100df69fa764b75eb9434305b5af4ef17"

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
