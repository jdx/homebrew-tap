class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.4/rtx-brew-v1.30.4-macos-x64.tar.xz"
      sha256 "eb59df83e592a5947397651def0c24c0227cc185284309ff8bbaff3a75632c7d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.4/rtx-brew-v1.30.4-macos-arm64.tar.xz"
      sha256 "b0e49686022964c691c1504cf23972c72abb6f2533daab98475b36f9712267eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.4/rtx-brew-v1.30.4-linux-arm64.tar.xz"
      sha256 "6c15f51f7dc564acb0e4b1c3fb6b86da8b05d63147a69040ed6b25db770b5806"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.4/rtx-brew-v1.30.4-linux-x64.tar.xz"
      sha256 "c501c01061e824e3de7f6132ec20e8eb17d348b8b1ceed63cce1129284368eb7"
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
