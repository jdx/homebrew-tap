class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.4/rtx-brew-v1.22.4-macos-x64.tar.xz"
      sha256 "d738a999911c2fab308f25cd5265d6414d06b28068047c4533f24533d90fd226"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.4/rtx-brew-v1.22.4-macos-arm64.tar.xz"
      sha256 "b8ce56d815d7e1e06476c66fe73aff7a01edf26972999a2235e4260a964581f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.4/rtx-brew-v1.22.4-linux-arm64.tar.xz"
      sha256 "4a93ba04573da917d2847804e12a42dc736ca229e0a3287b97a48560dd3d826d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.4/rtx-brew-v1.22.4-linux-x64.tar.xz"
      sha256 "4f5d972aaee4bbe6567e9521397e836673dc656d30fb01b9d28e1f30b6179331"
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
