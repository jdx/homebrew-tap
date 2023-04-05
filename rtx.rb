class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.12/rtx-brew-v1.27.12-macos-x64.tar.xz"
      sha256 "49938149436e7a9aa1b3f30faf9dd54fde1884e40705d67855c7e0526d3f62ad"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.12/rtx-brew-v1.27.12-macos-arm64.tar.xz"
      sha256 "1dedebd9d2b01dd650ae3124b5b420f3c5deab2fe9a2d87072b12f63c4492d57"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.12/rtx-brew-v1.27.12-linux-arm64.tar.xz"
      sha256 "c88d53ad53e0636964b0a57a4c5a1044276c46308c4428e5eb7d575edb529475"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.12/rtx-brew-v1.27.12-linux-x64.tar.xz"
      sha256 "4b5325b555df3721165b6c863eba166c03e8c1bce95cb57b5029ce4e4ec80253"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
