# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.24"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.24/rtx-v2023.12.24-macos-x64.tar.xz"
      sha256 "f5172ddd7614c7729c53457f285524ccc8dd5dbe12b4e1c5e5451d13b09d27c3"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.24/rtx-v2023.12.24-macos-arm64.tar.xz"
      sha256 "6a048291d220f85dfd4a7d053ab7dff787e3d977eacf4ae6ff529922cd77f4c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.24/rtx-v2023.12.24-linux-arm64.tar.xz"
      sha256 "9427c1c0094f44672f0b214cc4b68b93d5f11e3d66f00c49e23024927740fbf9"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.24/rtx-v2023.12.24-linux-x64.tar.xz"
      sha256 "8c0e43f74c65eb68578a2efda581ad6240f16e1641df14405db02847c1d8eb9b"
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
