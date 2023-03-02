class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.20.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.2/rtx-brew-v1.20.2-macos-x64.tar.xz"
      sha256 "dde04d70a334127401436ac9ff2bc18873d2bdb0bd79c75955eb2a37fb45fdc6"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.20.2/rtx-brew-v1.20.2-macos-arm64.tar.xz"
      sha256 "4ba75c651fe918d6600ebd9b6f8834c31537b10d4fcfe5c7b4f1dae6fc83130c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.20.2/rtx-brew-v1.20.2-linux-arm64.tar.xz"
      sha256 "a8a28afaf0764d21088ca47851d34ec137db8083353005119e1a0b43847f0350"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.2/rtx-brew-v1.20.2-linux-x64.tar.xz"
      sha256 "2a4bac07e677c936c9b8821c2ba766f67ce4bfb3c237bf659a29c5e7f67b06ad"
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
