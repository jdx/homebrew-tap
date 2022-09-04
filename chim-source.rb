class ChimSource < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  url "https://github.com/jdxcode/chim/archive/v1.0.2.tar.gz"
  sha256 "5c8cf7d7105f0db45d0a76e53acc3d1a22b09b6aae474e1d1aae6990fb6ad5eb"
  license "MIT"
  head "https://github.com/jdxcode/chim.git", branch: "main"

  livecheck do
    url :stable
    strategy :git
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/chim", "--version"
    (testpath/"test-chim").write <<~EOF
      #!/usr/bin/env chim
      path = './test-chim-bin'
    EOF
    (testpath/"test-chim-bin").write <<~EOF
      #!/bin/sh
      echo "it works!"
    EOF
    chmod 0755, testpath/"test-chim-bin"

    assert_match "it works!", shell_output("#{bin}/chim ./test-chim")
  end
end
