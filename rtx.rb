class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.34.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.0/rtx-brew-v1.34.0-macos-x64.tar.xz"
      sha256 "adbeae856674311dd27eb8c9d39b222eda839418f82a152fde8636f66cd47aa7"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.34.0/rtx-brew-v1.34.0-macos-arm64.tar.xz"
      sha256 "3cb4f06b5a327dbba1a85b864120aa6def6302073da3d4034d8706a01839628f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.34.0/rtx-brew-v1.34.0-linux-arm64.tar.xz"
      sha256 "90bb6d644be99582bf574fd8ff3af6ce524055c5084407dc7828abbdf77a5891"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.0/rtx-brew-v1.34.0-linux-x64.tar.xz"
      sha256 "aeec75b18fdec86f0d52b3ff5702c555d66904079bf4277a94e23e125bc9fd1c"
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
