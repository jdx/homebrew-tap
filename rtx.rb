class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.0/rtx-brew-v1.27.0-macos-x64.tar.xz"
      sha256 "6c823213071cf4d3700e2c388145e4e028f422642e31e80d4ac4bf6516eb4c68"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.0/rtx-brew-v1.27.0-macos-arm64.tar.xz"
      sha256 "e726a3a216b002ad889b059b8fd79d890bb6fb541d5819d51c1b17f682043db8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.0/rtx-brew-v1.27.0-linux-arm64.tar.xz"
      sha256 "143d49036196d453da2e7847b95ff851e5e4985f39c27549c116fafc1a3f5de5"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.0/rtx-brew-v1.27.0-linux-x64.tar.xz"
      sha256 "f669bd09771b332063f410d22c1c7f477bf4c7b39ca36d63d718b43db1e941d9"
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
