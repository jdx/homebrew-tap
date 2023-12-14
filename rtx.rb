# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.26"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.26/rtx-v2023.12.26-macos-x64.tar.xz"
      sha256 "b19c6d90849f03f03359ffdd11f159f5d3b3428e5ee2affa5429058a233779d0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.26/rtx-v2023.12.26-macos-arm64.tar.xz"
      sha256 "ddd34f6937e4dd993d9e8b450813ed1089fc452afd57b797c8c44923fba74443"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.26/rtx-v2023.12.26-linux-arm64.tar.xz"
      sha256 "e5e32a6dc5717e1e1d592b3f7f8b7010e110e9f2c9685caac8dba9c94b1f0953"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.26/rtx-v2023.12.26-linux-x64.tar.xz"
      sha256 "1e3f37030594eae0f76643741c82846577089a9e6e1afe932ea0aeb5bb3a8401"
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
