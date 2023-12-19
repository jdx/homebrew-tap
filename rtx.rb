# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.31"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.31/rtx-v2023.12.31-macos-x64.tar.xz"
      sha256 "9fa1b7206b2da1ba571be5c20db5d069738216b4f82d8626dc2526629bda6aa9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.31/rtx-v2023.12.31-macos-arm64.tar.xz"
      sha256 "e315f7bd29d817379aebd685d838681cb8811a5c5ae021e66d57139d61b49db6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.31/rtx-v2023.12.31-linux-arm64.tar.xz"
      sha256 "bb597bc41e0d434cf9cd4406a363b983550713d0445172454c0ab8970cf1b702"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.31/rtx-v2023.12.31-linux-x64.tar.xz"
      sha256 "67d09ceb4cfeecc141bebd91552b71500cb8e2e8e6b3e668bf4d29a1b67c7869"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    share.install "share/fish"
    generate_completions_from_executable(bin / "rtx", "completion")
    lib.mkpath
    touch lib / ".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
