class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.3/rtx-brew-v1.30.3-macos-x64.tar.xz"
      sha256 "922964c302942bc00a73b815828a4e7f7cf5cc59b4f9c4658eab82b4f73e7100"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.3/rtx-brew-v1.30.3-macos-arm64.tar.xz"
      sha256 "cb984a9bca941d08649aa673cb4674c3a50788570e63d01fdb53a2ded62e47e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.3/rtx-brew-v1.30.3-linux-arm64.tar.xz"
      sha256 "4620ea8eb72b1bc9f93c44d23ebe929f2415556c62f008b7ebe5808a1485e233"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.3/rtx-brew-v1.30.3-linux-x64.tar.xz"
      sha256 "f1fa8af52058488dbd081297f392258215dcef68d53bab3db47d60a331ed71f9"
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
