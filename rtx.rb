class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.14.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.3/rtx-v1.14.3-macos-x64.tar.xz"
      sha256 "08373c93f216c1bfce1808cbb6fc895eefa5c415cf964cc7b0d5bb2ec0f75882"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.3/rtx-v1.14.3-macos-arm64.tar.xz"
      sha256 "19161e5fc0edbba612e97f9203bfe25525a3e59e8ffe72495a002ba4c8018b85"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.3/rtx-v1.14.3-linux-arm64.tar.xz"
      sha256 "b8dc8c08667b0e046e5c54609ce860057115b25f8572c097df5e1c581b17c008"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.14.3/rtx-v1.14.3-linux-x64.tar.xz"
      sha256 "71b60e134c05dc4066af74e3a608ffa644691bb175b28a1bdd6e45b6d54b1561"

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
