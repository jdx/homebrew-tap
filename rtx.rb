class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.2/rtx-brew-v1.29.2-macos-x64.tar.xz"
      sha256 "5379302e35be30f305ad2d7696fc0e74213cce6539e8853a25ff53642d16e8f4"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.2/rtx-brew-v1.29.2-macos-arm64.tar.xz"
      sha256 "8405d9f7b3e98ebf178335d8986eecc9eb23a8ad54e339afc7b006fd21735a5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.2/rtx-brew-v1.29.2-linux-arm64.tar.xz"
      sha256 "09533960a29f43839e1ae48faca49475744a2ad2f85f510c2016f37ddb740115"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.2/rtx-brew-v1.29.2-linux-x64.tar.xz"
      sha256 "a6ca94f64a739ad0c2b8cf5a4c1ae20112de72ddfcba7b4ffe52ce5295631604"
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
