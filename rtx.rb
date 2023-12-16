# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.30"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.30/rtx-v2023.12.30-macos-x64.tar.xz"
      sha256 "f9e6355014ace4f77670c060ee4ba2454204abf152643c728821c6f739b233bc"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.30/rtx-v2023.12.30-macos-arm64.tar.xz"
      sha256 "149bacd742b66d742fa649c57267a3feab4255c1e521ac348e61c159dbc78629"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.30/rtx-v2023.12.30-linux-arm64.tar.xz"
      sha256 "1cd476eab21712ce87bc48de0e20e89eeb3bf66a48ca6b9003a0e5ef8202b3a0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.30/rtx-v2023.12.30-linux-x64.tar.xz"
      sha256 "9ca671fc4e2d83f756450b03e9f04da05bc524112d75b8a1667350b88ead80c3"
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
