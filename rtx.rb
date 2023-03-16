class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.8/rtx-brew-v1.23.8-macos-x64.tar.xz"
      sha256 "eda8fb4cf7c5a0cbb5ccad3ba5f20377bbacf788e7e84bc10b208c3a67da85cb"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.8/rtx-brew-v1.23.8-macos-arm64.tar.xz"
      sha256 "879f60ee1dac8a4f23b5770a1c074464c39150ef3c600616c6a5ba573c9bdd3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.8/rtx-brew-v1.23.8-linux-arm64.tar.xz"
      sha256 "1bd879c5dde769a7f96ac2b4411bc7edaaaa8e662e6b8744b6720519f888b8c1"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.8/rtx-brew-v1.23.8-linux-x64.tar.xz"
      sha256 "6535f3bf671406dd3cee51d01aec6494322a328ecc0fa1aa57aace335bf943dd"
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
