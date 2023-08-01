class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.8/rtx-nonup-v1.35.8-macos-x64.tar.xz"
      sha256 "1cb0e921b11a2f335f75da23b7b92186f73d082f4ec6189fecd991b569066572"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.8/rtx-nonup-v1.35.8-macos-arm64.tar.xz"
      sha256 "b73fd273aa65c8e3db15543bd44dc2d2cc1f7863c0af71e099b7b32b0f445295"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.8/rtx-nonup-v1.35.8-linux-arm64.tar.xz"
      sha256 "1b8edddea3cf5028971a1293c1825950d5860beb8ca2e36132d57feb7862b10e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.8/rtx-nonup-v1.35.8-linux-x64.tar.xz"
      sha256 "a1f5ed691d614151b69c2f02f705d87ef767fcc4062e00c590cb3bc2e6c396a5"
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
