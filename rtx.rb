class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.6/rtx-brew-v1.29.6-macos-x64.tar.xz"
      sha256 "4e7173cb401cdcfd0637ff92e7f9934aabf2a237e84163f222dc40936a7f37f5"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.6/rtx-brew-v1.29.6-macos-arm64.tar.xz"
      sha256 "171c2a3237fe573503dc7c036c40636179b0f30d15344af13ac3b3493c5424e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.6/rtx-brew-v1.29.6-linux-arm64.tar.xz"
      sha256 "3e2523b1e382abc7c9ecbda7946eb01ed65e827393d68e2a7d3de6e0b04511f9"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.6/rtx-brew-v1.29.6-linux-x64.tar.xz"
      sha256 "ffa2b79b44f9878fd10469ca96aac11c19adcef0c2fa812b0c766fcfd1f0c2cb"
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
