# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.25"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.25/rtx-v2023.12.25-macos-x64.tar.xz"
      sha256 "13a120aba586bc6792852c90fd68f2d3df8d4d04cccd9b615a23fff72cf180c5"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.25/rtx-v2023.12.25-macos-arm64.tar.xz"
      sha256 "e788448a3ef261cffa26b31403ea3fe60b184ea29c95813e1b7cd8b3ddf1a34d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.25/rtx-v2023.12.25-linux-arm64.tar.xz"
      sha256 "4a51932fe207ad6299c7ecc306ef8f328dee6466cba281fe7d68673457f1ae2c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.25/rtx-v2023.12.25-linux-x64.tar.xz"
      sha256 "34e8e4dc9d38914450a9e3ccf39de9d3599ffdc8ae898e6d20113e321a835837"
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
