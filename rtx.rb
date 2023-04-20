class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.6/rtx-brew-v1.28.6-macos-x64.tar.xz"
      sha256 "db1544b3969c9636a417b7dea5acb7df3812558cf23c1a6842a00743ea0f8d5b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.6/rtx-brew-v1.28.6-macos-arm64.tar.xz"
      sha256 "257c7045bfa5cb410e6e2c76b80f4c7f8027e379d9a633e617ae53974d4d1d8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.6/rtx-brew-v1.28.6-linux-arm64.tar.xz"
      sha256 "2c93cf5c0e1ec7beec4cc158deacd7bc74a9d33c5da67d88e660c12a45c575cb"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.6/rtx-brew-v1.28.6-linux-x64.tar.xz"
      sha256 "6acef1b9aaf832384b1d29bdd7110f129750e6bf223489fb9e7762e470b39fc3"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec nodejs@20.0.0 -- node -v")
  end
end
