class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.3/rtx-nonup-v2023.12.3-macos-x64.tar.xz"
      sha256 "cbcbcc0856d3bab04068d399040444d66e04b038a9416c530704e3377198a76a"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.3/rtx-nonup-v2023.12.3-macos-arm64.tar.xz"
      sha256 "7737bb5c5b93b46708718d6f53be708304cf4ba516a7cce408d17758c821c83a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.3/rtx-nonup-v2023.12.3-linux-arm64.tar.xz"
      sha256 "1fae907e4651886f8bf6ae3c68f4a93dc59de7c955e19b682018a38c92630fe3"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.3/rtx-nonup-v2023.12.3-linux-x64.tar.xz"
      sha256 "24f8db172e45571c1f682fe0cc3a2df2a8cc386c79e38f7fb5f15e696c4d53ac"
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
