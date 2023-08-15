class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.0/rtx-nonup-v2023.8.0-macos-x64.tar.xz"
      sha256 "06f73bb844021aa06c416a9be6f5c2837c96471a26b8fd94f477d210c73ace7b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.0/rtx-nonup-v2023.8.0-macos-arm64.tar.xz"
      sha256 "f4dd8cf7806ffc26fe6a5738db306df079a1f322a18e227a948e5dc2ecd1b6e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.0/rtx-nonup-v2023.8.0-linux-arm64.tar.xz"
      sha256 "e814d273a04572189329100fb37583319d3b16618635a61655459eef1f2e7288"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.0/rtx-nonup-v2023.8.0-linux-x64.tar.xz"
      sha256 "202c67ea263486815b0e9c63e0fed5575d72e9f35de1472393b7f08ab48bc5b7"
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
