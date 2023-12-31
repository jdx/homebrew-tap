# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2024.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2024.0.0/rtx-v2024.0.0-macos-x64.tar.xz"
      sha256 "0f6b2644627bd4f3b61f232e620d3ad9842003b3ab8075053b6e262e6b6eed5c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2024.0.0/rtx-v2024.0.0-macos-arm64.tar.xz"
      sha256 "da1af273f65c122395751a543694a457b96c4b513431738a3328590138e236e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2024.0.0/rtx-v2024.0.0-linux-arm64.tar.xz"
      sha256 "cc5489e4f6c434ac79e153a715f2305a04462cfc5785bcea8bdc12284ddfb0b4"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2024.0.0/rtx-v2024.0.0-linux-x64.tar.xz"
      sha256 "81282eee5f40ba1d641946be027adf46a02223f877455651b210cd20411093f1"
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
