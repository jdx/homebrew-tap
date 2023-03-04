class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.1/rtx-brew-v1.21.1-macos-x64.tar.xz"
      sha256 "21de5ea15733e70cdef2cd2f8ac054699d2da7322461eaa12307e787080fc275"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.1/rtx-brew-v1.21.1-macos-arm64.tar.xz"
      sha256 "c47d1acc1d2d996c8f7b4606c7ba65e683191327a09120b7a7f66a88c94be7d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.1/rtx-brew-v1.21.1-linux-arm64.tar.xz"
      sha256 "59966994dbc0709a20de3a90dfa2bdbbaa5f37b12dd1c126dae77bb4aad9d1ee"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.1/rtx-brew-v1.21.1-linux-x64.tar.xz"
      sha256 "1ce2c678d91e59dd5e09d4782fe4f2d0d704cefe5ea166fd55377c7029ee5fd7"
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
