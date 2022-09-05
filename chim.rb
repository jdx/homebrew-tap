class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.0/chim-v1.1.0-macos-x64.tar.xz"
      sha256 "e30965068718cde6c9fae40521478737b45c647aecdec86ade2dfbd8cb33d34c"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v1.1.0/chim-v1.1.0-macos-arm64.tar.xz"
      sha256 "2e5f74b2ad700135d03b149c2d9574c26c252477bb830d5c4aa8915a95c5210c"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v1.1.0/chim-v1.1.0-linux-arm64.tar.xz"
      sha256 "454447d502fae3c1ad19e0ef9c1698a54284079932f33338fbbb031224acd0f7"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.0/chim-v1.1.0-linux-x64.tar.xz"
      sha256 "4ab8aacbf7034fef16f1726089897977a2031a4d510610f04ac58aeb7eb6cf15"

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
