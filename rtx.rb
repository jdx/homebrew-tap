class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.7/rtx-nonup-v2023.8.7-macos-x64.tar.xz"
      sha256 "60a31fd88a3f2bdcb6e9aecfa3bb4415ba3f08d57c7b85411db09cf284e04005"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.7/rtx-nonup-v2023.8.7-macos-arm64.tar.xz"
      sha256 "5e792990ebafe268e3db92ea5e966b8924fa6e3c31fe29dcdbdb29684a051dd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.7/rtx-nonup-v2023.8.7-linux-arm64.tar.xz"
      sha256 "5a8f42cb8c090b0171bf159e323747868fb88a4ce14b513501316098193e9fda"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.7/rtx-nonup-v2023.8.7-linux-x64.tar.xz"
      sha256 "7d3610e770dc25685ffd78abae97e26e96072113976e5419f0df3823eab58d7a"
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
