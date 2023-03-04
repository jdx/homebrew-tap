class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.3/rtx-brew-v1.21.3-macos-x64.tar.xz"
      sha256 "616f10b75b035c37e7d6ccdec28f57a00142b08c7de0b1325d2e7e5a61c1203d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.3/rtx-brew-v1.21.3-macos-arm64.tar.xz"
      sha256 "5f731a06d4461788af2342e27d8eb888db27dce8adfaf05bda9963aaf05f7292"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.3/rtx-brew-v1.21.3-linux-arm64.tar.xz"
      sha256 "5396ac12ebfdcf8f8053d7eb4b260e48f8a5fc53bf5695b515deee963810bf24"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.3/rtx-brew-v1.21.3-linux-x64.tar.xz"
      sha256 "46b74438c191eaea50bab8d4a679cdc38e04db6c1032b73bd3f1e96c283c87ff"
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
