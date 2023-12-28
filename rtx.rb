# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.40"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.40/rtx-v2023.12.40-macos-x64.tar.xz"
      sha256 "4360c0111bbde73b46f39b357456abe053536b4ccc7df4303b4f1bcb5e7583ea"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.40/rtx-v2023.12.40-macos-arm64.tar.xz"
      sha256 "d55c210d317a4ff94f7a452edddb7fe4da7c1d421e5eb6a06736401841347f9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.40/rtx-v2023.12.40-linux-arm64.tar.xz"
      sha256 "1a450942eee754897c3bec66e42664eb8f31a44dfaf0146e7ac889e4dcb78b59"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.40/rtx-v2023.12.40-linux-x64.tar.xz"
      sha256 "6a5a8b6c2c5b3ed56d09cebf35051ec08233474243c57294ce9be2ed3790694d"
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
