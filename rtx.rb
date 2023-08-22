class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.4/rtx-nonup-v2023.8.4-macos-x64.tar.xz"
      sha256 "b323521579602527eadede6830e7e67ac558d4047eab4fea45147366415a3180"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.4/rtx-nonup-v2023.8.4-macos-arm64.tar.xz"
      sha256 "4585d880af74dd59c663a368a55484780cf6d50d3de1eea601a35dd574a6f819"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.4/rtx-nonup-v2023.8.4-linux-arm64.tar.xz"
      sha256 "6137cda72ee397de88eb3e86fee3861d4f96eac907fb52022f2ad8457bada615"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.4/rtx-nonup-v2023.8.4-linux-x64.tar.xz"
      sha256 "a6111e24874c026b29fe30c3b50d65f9dc0426ddadb971310ee7343499ea3751"
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
