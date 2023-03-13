class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.4/rtx-brew-v1.23.4-macos-x64.tar.xz"
      sha256 "91cbc0f2bd564acafac3da76b0c17f8a9be46bc9da716393211ccb0d3258c08c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.4/rtx-brew-v1.23.4-macos-arm64.tar.xz"
      sha256 "bfbd0bfca130a16c786d25273bf1985051123adebd86c8c2411032eb683604b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.4/rtx-brew-v1.23.4-linux-arm64.tar.xz"
      sha256 "4b2aff096d1a5237f01fedcf2c702896c0857c3cd1fab8971e797087313c5fff"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.4/rtx-brew-v1.23.4-linux-x64.tar.xz"
      sha256 "1d2c49fd5f93196908102e958097b77cede5cd13b96e5836cd90b2911e12772b"
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
