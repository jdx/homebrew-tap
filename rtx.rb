class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.31.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.31.0/rtx-brew-v1.31.0-macos-x64.tar.xz"
      sha256 "79415a96c5a968469ccbe7be669d27b659d1bb6b06a913e7169e10dc7931fc9c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.31.0/rtx-brew-v1.31.0-macos-arm64.tar.xz"
      sha256 "0caffd092017b44cbce15dbe3e8d16663a791774cf56995442ab35b231dd2b4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.31.0/rtx-brew-v1.31.0-linux-arm64.tar.xz"
      sha256 "31b1cba3ed6225d2d223872d17108a7dcc9deeb288fc688d8add860cced9d773"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.31.0/rtx-brew-v1.31.0-linux-x64.tar.xz"
      sha256 "bf8a48fcbacb78b2d93d85c9892623d43332a31c18d3805885bd4e5c859b8971"
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
