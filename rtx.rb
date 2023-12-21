# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.32"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.32/rtx-v2023.12.32-macos-x64.tar.xz"
      sha256 "dae88904b66c1dbb49e57d54f16033c0c2040dfb7593997ac7114f310c7cec0a"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.32/rtx-v2023.12.32-macos-arm64.tar.xz"
      sha256 "7987d905c4067352b4635c347bbd3cba69f0bd7288824bb8b0b3f62b9974b7ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.32/rtx-v2023.12.32-linux-arm64.tar.xz"
      sha256 "d0ba69ac1cb88fb972a97f63ac5cea8f3e331f9375df59ebdf12ef45b4cf14f1"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.32/rtx-v2023.12.32-linux-x64.tar.xz"
      sha256 "95e23f7ec301d9e44c3dd72ba318053fde23b7052deb9ad1d9525ada54736dd2"
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
