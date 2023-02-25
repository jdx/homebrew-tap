class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.17.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.17.0/rtx-brew-v1.17.0-macos-x64.tar.xz"
      sha256 "45d621afad9d4703d187f985235e6be017e8c89ba1d0182002b2562a421a25ae"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.17.0/rtx-brew-v1.17.0-macos-arm64.tar.xz"
      sha256 "1a6f810680929103921697f472aa0707999a61948d4243f326a3869c74d356fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.17.0/rtx-brew-v1.17.0-linux-arm64.tar.xz"
      sha256 "8aa1a0a8a8e54bc72029abef03f3bfb8ffcf7859ba1cc9f7b701cbd9f9272677"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.17.0/rtx-brew-v1.17.0-linux-x64.tar.xz"
      sha256 "c9ba0bbfb16ab2f85f1fb94385c301036cbe96ce8ab1fa673b3ac736e07c8b3f"
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
