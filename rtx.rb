class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.20.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.1/rtx-brew-v1.20.1-macos-x64.tar.xz"
      sha256 "c5adf90c6d8a44b51bba6c94f3d91a8831f9952ddf7e28147eabfb1102931657"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.20.1/rtx-brew-v1.20.1-macos-arm64.tar.xz"
      sha256 "af2d977c993268cad2b6a160e536de5be9c085cea22089c66d5ba18efaa5e4b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.20.1/rtx-brew-v1.20.1-linux-arm64.tar.xz"
      sha256 "5a77a2e67c58ac5159ecf15fa1847adfc47f839d929cbc762d184820f6566d04"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.1/rtx-brew-v1.20.1-linux-x64.tar.xz"
      sha256 "9acde7479b4dad6fb59c442cff143624ea5c09ee4710a52abe93f8a5a6d2d13a"
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
