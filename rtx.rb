class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.2.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.5/rtx-v1.2.5-macos-x64.tar.xz"
      sha256 "7f8dc640dfe6fad557b35e39cf5824c3b97e498be26240d940ff4018e482f3bf"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.5/rtx-v1.2.5-macos-arm64.tar.xz"
      sha256 "6ab29fc9efa3e8a59a6d11d9e5f1bb03997879dd05626826438773f54ccfb42d"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.5/rtx-v1.2.5-linux-arm64.tar.xz"
      sha256 "3f03c933754f720aeec9eb7a7ff2b4b3e47e5cf6ac99e5a2fae46b5a8f38119c"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.2.5/rtx-v1.2.5-linux-x64.tar.xz"
      sha256 "e5f33bf97fa8f1b0d26c2f3fbed25cdb78413774dcf3a6588eb993e77b61bb53"

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
