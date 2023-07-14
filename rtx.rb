class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.34.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.1/rtx-brew-v1.34.1-macos-x64.tar.xz"
      sha256 "92d8991d5c81e4c83fb65030fb26b708dbdd582bbf9d24f72f95a38f688da51a"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.34.1/rtx-brew-v1.34.1-macos-arm64.tar.xz"
      sha256 "4c99a5b9cbf717c575be706fbed80178ea44793537f88d6903eb0c5eab916dc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.34.1/rtx-brew-v1.34.1-linux-arm64.tar.xz"
      sha256 "ea1faaa42652825e6ce77bcaef7a7fbdcbacf2f8e86de1cf9f9d52d81cc5b102"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.1/rtx-brew-v1.34.1-linux-x64.tar.xz"
      sha256 "e29128a529b2af5b65cdfcfad95aca04ab4fdeddb79ff23bd2ef130f105586f1"
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
