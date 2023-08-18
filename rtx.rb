class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.2/rtx-nonup-v2023.8.2-macos-x64.tar.xz"
      sha256 "177e167ab2715f15afad7bc37613b35f13572f6f52941b5415334b48d3dd77aa"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.2/rtx-nonup-v2023.8.2-macos-arm64.tar.xz"
      sha256 "2ec9981eb7438ca321d24330fcff4fb23d21dabb2dccc8ffa1f2f259cc515ed3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.2/rtx-nonup-v2023.8.2-linux-arm64.tar.xz"
      sha256 "4315840b13b7ee30e91744877beb107810d26dab9914a36760afcbdd87a0cb12"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.2/rtx-nonup-v2023.8.2-linux-x64.tar.xz"
      sha256 "a7fd35c9a474935ba8d71f6e23812d4b412c8f424142441bf838a30b02a1ad9c"
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
