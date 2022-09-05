class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.2/chim-v1.1.2-macos-x64.tar.xz"
      sha256 "5af8e65494a2305448d11f7f6c4f5a230099b75ddd26bb1c1d178e0b353b3350"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v1.1.2/chim-v1.1.2-macos-arm64.tar.xz"
      sha256 "02fe28118982a5af2414092fb9494d1f5bd3e22276c60917bb9efe6ed3b1edca"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v1.1.2/chim-v1.1.2-linux-arm64.tar.xz"
      sha256 "e0c83081407b8e659f8c9dee9a7d238025c84ca38601676b7360c106958862f8"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.2/chim-v1.1.2-linux-x64.tar.xz"
      sha256 "dde02ed932e36dfa874cbf6bb1029a72395881434fdffe251ade6562f178f3fa"

      def install
        bin.install "bin/chim"
      end
    end
  end

  test do
    system "#{bin}/chim --version"
    (testpath/"test-chim").write <<EOF
#!/usr/bin/env chim
path = './test-chim-bin'
EOF
    (testpath/"test-chim-bin").write <<EOF
#!/bin/sh
echo "it works!"
EOF
    chmod 0755, testpath/"test-chim-bin"

    assert_match "it works!", shell_output("#{bin}/chim ./test-chim")
  end
end
