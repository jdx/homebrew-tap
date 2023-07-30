class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.5/rtx-brew-v1.35.5-macos-x64.tar.xz"
      sha256 "433e97ddcfcf7f6135d27e2cde2007c013bfce61030c21132337b5e8a68e834f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.5/rtx-brew-v1.35.5-macos-arm64.tar.xz"
      sha256 "1c52816d94e251e7ddb9eb5af067a964a1f471a3500ec1968a925cdcb584b616"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.5/rtx-brew-v1.35.5-linux-arm64.tar.xz"
      sha256 "920549b38f3d5136408d5e563c776039f2d3ee7bf4afe98566414a0956dd9162"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.5/rtx-brew-v1.35.5-linux-x64.tar.xz"
      sha256 "35242d8dbe866bdb00c771ed2a61362d08d2e304cdef6e09548477075d02f10f"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
