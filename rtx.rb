class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.25.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.3/rtx-brew-v1.25.3-macos-x64.tar.xz"
      sha256 "e686792437c6db5f24bb71271480fd429cb785e5be8778ecb1931103ddd8c872"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.25.3/rtx-brew-v1.25.3-macos-arm64.tar.xz"
      sha256 "c1a984b4aad43c02170673b0fca8ef327d19e0f1b9eea9463ff870ffe5ffd2e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.25.3/rtx-brew-v1.25.3-linux-arm64.tar.xz"
      sha256 "7becf4350b46d18fea99e722464fc5e145a4d56b0b3e1c05af6f5b38fcd06a6d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.3/rtx-brew-v1.25.3-linux-x64.tar.xz"
      sha256 "43e4ed89e8ed07bf94017356b7fb0e0829a898dc4175ccfb6042da20022d1213"
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
