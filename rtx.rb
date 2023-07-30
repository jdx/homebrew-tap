class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.7/rtx-nonup-v1.35.7-macos-x64.tar.xz"
      sha256 "de095b6ba7e3b65e4266065f7c513ece662d9c09a1d900904fd4521119d38b76"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.7/rtx-nonup-v1.35.7-macos-arm64.tar.xz"
      sha256 "b11f462f592060a92920c332021b8a1b51899edd242c3daa51485ff5a28b0fb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.7/rtx-nonup-v1.35.7-linux-arm64.tar.xz"
      sha256 "e3ab8ed2987b64105c0f04462c5731ab9a5956247a626d2e45f7ff89e1709759"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.7/rtx-nonup-v1.35.7-linux-x64.tar.xz"
      sha256 "a50c811438b5cfbb6286dfb4c13ee3385440ecaf1ed72501d1cb407e5c5a534b"
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
