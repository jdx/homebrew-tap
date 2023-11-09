class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.2/rtx-nonup-v2023.11.2-macos-x64.tar.xz"
      sha256 "225291b3e7d5c14bf03bcc583591630ead814865bd633e1ce552c588b4aea538"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.2/rtx-nonup-v2023.11.2-macos-arm64.tar.xz"
      sha256 "f83d945a6a5a0edf97d85d280ee6273101e116ecb9a87be4c481f56266c06dff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.2/rtx-nonup-v2023.11.2-linux-arm64.tar.xz"
      sha256 "9cb197ec640bea94d6be485ffe5ab0b3b2f229cb28e6b298907afa598f4c4629"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.2/rtx-nonup-v2023.11.2-linux-x64.tar.xz"
      sha256 "c69d67d5b49eaaf8cc5486d0a6d9e6cbed6411f7de753e0b5272e52368c2fdbd"
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
