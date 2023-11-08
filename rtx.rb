class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.1/rtx-nonup-v2023.11.1-macos-x64.tar.xz"
      sha256 "1ecd438b045893e4f8ed6c0bc7848603b24844c6def9e43dd2f02db6df8bdc84"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.1/rtx-nonup-v2023.11.1-macos-arm64.tar.xz"
      sha256 "c5b4ffed8817b16d96d0d35d92f51ccbb4c2a5d1f7fb841d3c36d3a3ea88070d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.1/rtx-nonup-v2023.11.1-linux-arm64.tar.xz"
      sha256 "9337e1251167ca92b233d8c5f232bcd9c04bd1084c25294e4e56e834fbe545fa"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.1/rtx-nonup-v2023.11.1-linux-x64.tar.xz"
      sha256 "00e9ae3b5908c9610a42dfc264510fab4f671f6dd8347211dc83f5354bab4249"
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
