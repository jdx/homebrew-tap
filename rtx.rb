class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.9.0/rtx-v1.9.0-macos-x64.tar.xz"
      sha256 "f65623a9b39cfaf913de0743fcfdffc3254eb74af57fa9e25609b7d101f6ca32"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.9.0/rtx-v1.9.0-macos-arm64.tar.xz"
      sha256 "3364d06c616228d6fe78504833d330b6b7f7b92fd6733cea06bafd5e5f064af7"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.9.0/rtx-v1.9.0-linux-arm64.tar.xz"
      sha256 "db10169e2ddd25e5243acbeccdd1292a8a4358395a75b28d31b79b7ff5e15b8f"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.9.0/rtx-v1.9.0-linux-x64.tar.xz"
      sha256 "947436bad0cff9fe3e2fcdf248559de5ca3f10de37d4a5b9a67face28eaa74f2"

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
