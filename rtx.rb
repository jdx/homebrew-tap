# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.36"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.36/rtx-v2023.12.36-macos-x64.tar.xz"
      sha256 "d3d0bc0b6a35c703fa7ad05926ecc9d65c5a140c50d384735e236f2b9680a625"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.36/rtx-v2023.12.36-macos-arm64.tar.xz"
      sha256 "f9bd37623bb5ca6e38572ef740da39c212fbd321d7e5c268efe798d00c74b742"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.36/rtx-v2023.12.36-linux-arm64.tar.xz"
      sha256 "510b7330682b4b4bc7c31960e1e8528f095bddfcfc440a2da5d1c7ed22dc82a3"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.36/rtx-v2023.12.36-linux-x64.tar.xz"
      sha256 "72e23db353fc1055dddff93f40241797b00a3f9f8a4d87fdb28effef2f3af757"
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
