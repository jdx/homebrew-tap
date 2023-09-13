class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.9.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.1/rtx-nonup-v2023.9.1-macos-x64.tar.xz"
      sha256 "4767e3edf68e4d72ca2347e86e31967f68d7e548afff14a954ba5ccb981b26e0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.9.1/rtx-nonup-v2023.9.1-macos-arm64.tar.xz"
      sha256 "2b88befd74ac9a39313964b44fb028b7bad38f4e5ac673b3efdc02306f0b21e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.9.1/rtx-nonup-v2023.9.1-linux-arm64.tar.xz"
      sha256 "da6745e22e4fdea4e1fd5eb692da5c1d8c06528269441d224a0a98f61bce1837"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.1/rtx-nonup-v2023.9.1-linux-x64.tar.xz"
      sha256 "cc864255293ad44055485045a702ccc208fc2dd522f7d6a8aaa14b0b14f27b0e"
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
