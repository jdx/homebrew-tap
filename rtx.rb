class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.26.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.0/rtx-brew-v1.26.0-macos-x64.tar.xz"
      sha256 "683e1e2ebefd8dce47750f551b91f8e874da407fe349a0d4fb4bbf6b3cf5ad18"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.26.0/rtx-brew-v1.26.0-macos-arm64.tar.xz"
      sha256 "41beec185f9b87c4bb5fb5264ed16063b0abc85663584ef85a31a1960965151e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.26.0/rtx-brew-v1.26.0-linux-arm64.tar.xz"
      sha256 "81faad19a49b333c4205879f9d4b656b0375fc5e032f630dafaee9cacf7ab1f5"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.0/rtx-brew-v1.26.0-linux-x64.tar.xz"
      sha256 "370e3bbaeb066b2e23da306375b26156c6889b1391cc868aad7a9bb28020ab2c"
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
