class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.1/rtx-nonup-v2023.8.1-macos-x64.tar.xz"
      sha256 "0952f8d13363bb83b6b3cb6dbc5eec1e355575d869c58dd24a5a299c84073738"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.1/rtx-nonup-v2023.8.1-macos-arm64.tar.xz"
      sha256 "3e5f78a3e81705254e12b5b88bfb79b8d310bb39b778be6afcb6dde389000141"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.1/rtx-nonup-v2023.8.1-linux-arm64.tar.xz"
      sha256 "631abd951d6ae9dd3e7f7c5368b0fe89ad046b7e8fb0afb19bb9d6c8aaf41972"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.1/rtx-nonup-v2023.8.1-linux-x64.tar.xz"
      sha256 "69f76012e4c3a77e39e160d31ae5a14259c40d5224997b277264cbdae2ed0e58"
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
