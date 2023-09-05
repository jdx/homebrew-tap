class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.0/rtx-nonup-v2023.9.0-macos-x64.tar.xz"
      sha256 "8d1a48408d017a782ba879975b67305fbacf4f30e563c802c83eee95c6aa2f67"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.9.0/rtx-nonup-v2023.9.0-macos-arm64.tar.xz"
      sha256 "83702a26c18de3f712edbb0dec3920db5ed6232b8f6bdbdcf6957688ce180c66"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.9.0/rtx-nonup-v2023.9.0-linux-arm64.tar.xz"
      sha256 "7cc2033cbdd67698d1eb044bd4a4afb1523ced760ecaa997cdb779e1d621bf33"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.0/rtx-nonup-v2023.9.0-linux-x64.tar.xz"
      sha256 "9cc647a4af5cf4e718fa57271f945edc390d67d457fd56f0fa0a19208e84042d"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
