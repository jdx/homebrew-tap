# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.33"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.33/rtx-v2023.12.33-macos-x64.tar.xz"
      sha256 "2c57edc27e587abe1b8b2b3796b77fd5192782a4b4ace45f59e0baba6a470c4c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.33/rtx-v2023.12.33-macos-arm64.tar.xz"
      sha256 "7871a740026e5dcdd0bdb3fcad577a4481f0e0af5e12e257e0aa0b809ffb6f03"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.33/rtx-v2023.12.33-linux-arm64.tar.xz"
      sha256 "c5152e8d04eed338d9b96a1251c03926547f2d547513cec2becaa40a6f05c765"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.33/rtx-v2023.12.33-linux-x64.tar.xz"
      sha256 "cb65bff188b53d5239e015ee9de5aee02a809331bc756f0059e891b982e6fd26"
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
