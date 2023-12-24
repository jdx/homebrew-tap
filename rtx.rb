# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.37"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.37/rtx-v2023.12.37-macos-x64.tar.xz"
      sha256 "13b001166e306faedb0c1ee25e55b7573af877671852cbc60e6b27c86948bda2"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.37/rtx-v2023.12.37-macos-arm64.tar.xz"
      sha256 "12c119a1035ec2d06c00a009be4b1d6a33172bd175e1f70644b5348237ac044d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.37/rtx-v2023.12.37-linux-arm64.tar.xz"
      sha256 "7a45637f9a373e029107c3fb9ae6e66465369cde3dfd538d6d033b1bce38170f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.37/rtx-v2023.12.37-linux-x64.tar.xz"
      sha256 "55592a6b29f18c36b923608de01e2292a254aa7566983b8f580a61079057625e"
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
