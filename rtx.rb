# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.19"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.19/rtx-v2023.12.19-macos-x64.tar.xz"
      sha256 "f50a18d15a99b3ec4e5d958c3328da5ac55017cb217dbe869f8d8eac3518cab9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.19/rtx-v2023.12.19-macos-arm64.tar.xz"
      sha256 "deff475043712f4aaeb333f6fd43893a5a65403d89d960bac7798f8d9734b642"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.19/rtx-v2023.12.19-linux-arm64.tar.xz"
      sha256 "c6e391126eba287a8dd95c8d82a98baf231db9d382c0313ceb0b62132846f0ec"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.19/rtx-v2023.12.19-linux-x64.tar.xz"
      sha256 "244d050098e66c9620b37bf7faf5277e30b3584797072257d5af725bc9b2e85d"
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
