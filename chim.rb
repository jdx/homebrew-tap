class Chim < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  license "MIT"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.1/chim-v1.1.1-macos-x64.tar.xz"
      sha256 "91a1c401fd9ba270813e1328fcdaafb930001d871cd99ae1e0e14c6cc72c352e"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.arm?
      url "https://chim.sh/releases/v1.1.1/chim-v1.1.1-macos-arm64.tar.xz"
      sha256 "cc8a3adb7a86082d32137153af37f8bf5feb7ce955c94cce93eb90909702f6a3"

      def install
        bin.install "bin/chim"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://chim.sh/releases/v1.1.1/chim-v1.1.1-linux-arm64.tar.xz"
      sha256 "a16accf826fab8c89ddf2371c2605fbd725b08a954e9cc1543c111a4fdea82fc"

      def install
        bin.install "bin/chim"
      end
    end
    if Hardware::CPU.intel?
      url "https://chim.sh/releases/v1.1.1/chim-v1.1.1-linux-x64.tar.xz"
      sha256 "3ba72397060daa4b117f3e9d5978bbf1d10c4c5a06a431184794dc8bc9b57fd6"

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
