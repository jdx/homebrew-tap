# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.28"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.28/rtx-v2023.12.28-macos-x64.tar.xz"
      sha256 "e79249514f0cb5ed6176c390e841d5b11bf2e96a3b469423ec3a1783bb1c3143"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.28/rtx-v2023.12.28-macos-arm64.tar.xz"
      sha256 "ee40c0c2fcdcd89c9f75f0f4ab0ccb9b5d7b404d54ec76c6b07e43a9de14409b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.28/rtx-v2023.12.28-linux-arm64.tar.xz"
      sha256 "9528177a9d93f75617bd21e321d2c831fa65b7ffc185b182a44f5d671a053f07"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.28/rtx-v2023.12.28-linux-x64.tar.xz"
      sha256 "1f10e4d29baa4dc17b2fe5ea9564f7051ce37b8406e9a94235ce621f21b0aee6"
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
