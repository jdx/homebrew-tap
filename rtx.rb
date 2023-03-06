class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.5/rtx-brew-v1.22.5-macos-x64.tar.xz"
      sha256 "40c3f252dd4c947dfdde44d13bb3b58a8d2e8bbeeadf737732beb54fbe828880"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.5/rtx-brew-v1.22.5-macos-arm64.tar.xz"
      sha256 "2dc9b4037c301ad93fc8315d3d1750f74aba7be6d879eba93c00928bee5df68e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.5/rtx-brew-v1.22.5-linux-arm64.tar.xz"
      sha256 "a889688b7cfd07542772913c4ce8541c9038c25296d38cc27142bd7b37b2278f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.5/rtx-brew-v1.22.5-linux-x64.tar.xz"
      sha256 "67d1cbcb17557963d8952c8c19947d9b90b164da22b3ba8b573aa35d74866fb9"
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
