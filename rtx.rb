class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.6/rtx-brew-v1.22.6-macos-x64.tar.xz"
      sha256 "c1d6786eb7332f5b94639af014425588bc7212d921651e8324bae1eb413a73f7"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.6/rtx-brew-v1.22.6-macos-arm64.tar.xz"
      sha256 "760995c90f23876a3b050cc2af7943f58a71f1c6d8cca7440e5495c50fcdbe49"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.6/rtx-brew-v1.22.6-linux-arm64.tar.xz"
      sha256 "2c63c06e5c68b591245e62a838945e90ea14df12f848f8d173191fe02edbde1c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.6/rtx-brew-v1.22.6-linux-x64.tar.xz"
      sha256 "f5dee59384c284b4c82af9492c57bfb2949e2e7630203182ab8fd4240223a52b"
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
