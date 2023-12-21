# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.34"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.34/rtx-v2023.12.34-macos-x64.tar.xz"
      sha256 "4fe45c7b9b29b93c63ca9ae468b9a3c98065719423fff26a23a84e9bc529d7f2"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.34/rtx-v2023.12.34-macos-arm64.tar.xz"
      sha256 "8ffbbe8d2e5f4a7458dd2be8a182434e95bbdadbb27edaa61d497ee15d7d78bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.34/rtx-v2023.12.34-linux-arm64.tar.xz"
      sha256 "3533eef4d953faccc71b6d1362f53ae00b98397fc3767e7a2d4255c27d804002"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.34/rtx-v2023.12.34-linux-x64.tar.xz"
      sha256 "916d1c560d58a82bcd01b66a8da94e2b9f007e281fdb4a72e4fe4a2d8e4a04f5"
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
