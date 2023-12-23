# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.35"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.35/rtx-v2023.12.35-macos-x64.tar.xz"
      sha256 "5f6e78084d4cc422e07f7a36f872ff3fcb9f3e1b465402aaedfc578a84498b77"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.35/rtx-v2023.12.35-macos-arm64.tar.xz"
      sha256 "35add93fa076905447e68fbb4ba4cc947d1773e42d245f85bccfa7d5dedbb058"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.35/rtx-v2023.12.35-linux-arm64.tar.xz"
      sha256 "2fe767e418e948ea09387ec11c845cfa95c46569179c4a4e254260bb9ed7492e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.35/rtx-v2023.12.35-linux-x64.tar.xz"
      sha256 "a63b8d2c2bfa3cac3ba2da40011ca732b203d7b1003e2ecd167bd769aeb909f1"
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
