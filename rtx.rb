# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.22"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.22/rtx-v2023.12.22-macos-x64.tar.xz"
      sha256 "68d45a3631d4c21514f5362e86beedc619ae53c9a0ea842e7635786b69b324d5"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.22/rtx-v2023.12.22-macos-arm64.tar.xz"
      sha256 "fa8d9f8a02708e1b3d3af00bfc5879822226671806c3beff62bcd4d11795fb19"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.22/rtx-v2023.12.22-linux-arm64.tar.xz"
      sha256 "a32c8a3f11fda88653e46eff7bc3f566397c78e47ed55acc978e326fe1c51e48"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.22/rtx-v2023.12.22-linux-x64.tar.xz"
      sha256 "e78d8c6d652c3a3ecda876c3e3dfd110621221a3aadb0fdd5ca389e932a658c4"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
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
