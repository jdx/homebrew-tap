class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.0/rtx-brew-v1.21.0-macos-x64.tar.xz"
      sha256 "5991f6b4458e039eea2fa7203114fe23edbb91f320b09d0f9392743baa28bd2e"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.0/rtx-brew-v1.21.0-macos-arm64.tar.xz"
      sha256 "e17eac763bfb1d43b500a8c1c3bd1ad99546e25567c6b96b20fb715e2b14ecb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.0/rtx-brew-v1.21.0-linux-arm64.tar.xz"
      sha256 "7b84eba86e89f7466c55eb0527cabeaff453a577f27a137d15382b166e4f54b8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.0/rtx-brew-v1.21.0-linux-x64.tar.xz"
      sha256 "11b2953b2ca6afe0ef07428d1d7cf867238eb44f3809a739f61d1cab47bc94ab"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "complete", "--shell")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
