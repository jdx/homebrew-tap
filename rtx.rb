class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.10.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.2/rtx-nonup-v2023.10.2-macos-x64.tar.xz"
      sha256 "f3a46b0946b0f00387234ce3d20431cab0c2e4bb43eb38d7c17a92b8ba9c8d60"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.10.2/rtx-nonup-v2023.10.2-macos-arm64.tar.xz"
      sha256 "3c959791c69f094812080579df9c1cdc2c2ce84a4ec90159e7d15f647e12bd30"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.10.2/rtx-nonup-v2023.10.2-linux-arm64.tar.xz"
      sha256 "b4f7fcbb554b53ce0f0633860257418fadf29cac2bf59c8c5e943ca99d347959"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.2/rtx-nonup-v2023.10.2-linux-x64.tar.xz"
      sha256 "c659f3c69d393e15dda05d13514f849b5ffa0e0c04472536c695775fd37467b2"
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
