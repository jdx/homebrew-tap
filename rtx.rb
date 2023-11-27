class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.8/rtx-nonup-v2023.11.8-macos-x64.tar.xz"
      sha256 "c44d95183f7d80597912f0582a338601caff019656d34766c3acd3389066df28"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.8/rtx-nonup-v2023.11.8-macos-arm64.tar.xz"
      sha256 "d17fc83a48dd7f05c91f1240543fb9b0c6e179be1c517e63a22a76e8a9f9ad5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.8/rtx-nonup-v2023.11.8-linux-arm64.tar.xz"
      sha256 "6b67544e48dfee0fbd03ed7d287641a898b6204ca39141f9e0feae138f842ba4"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.8/rtx-nonup-v2023.11.8-linux-x64.tar.xz"
      sha256 "261b085f21540f427e74701070237a15b3450e29f75db0b7392c88e5e4df0237"
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
