class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.2/rtx-brew-v1.27.2-macos-x64.tar.xz"
      sha256 "5abf772270c3c34f1e347f92bbf09dfd6b2429a2509bc0249c2c43347f30d352"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.2/rtx-brew-v1.27.2-macos-arm64.tar.xz"
      sha256 "1de7370c48b53b7b19b6f782b3f36f01590dcd5910f32bfabc68320a451ebe41"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.2/rtx-brew-v1.27.2-linux-arm64.tar.xz"
      sha256 "470ec13d983f794eb0f102041f227c6ba0d8d2e1b1cd3a8133132a794c3c104e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.2/rtx-brew-v1.27.2-linux-x64.tar.xz"
      sha256 "a01cf74307e39434261eb13fb6d8e083fe30907bf2da6d0b8636662c1140cf8c"
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
