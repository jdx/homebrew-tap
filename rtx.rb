class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.4/rtx-brew-v1.27.4-macos-x64.tar.xz"
      sha256 "5dbed1440f6005029a1bf7fb9d9704b85690397b57e5254630a7b192fca37d6d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.4/rtx-brew-v1.27.4-macos-arm64.tar.xz"
      sha256 "c933640e3f5c4c9a921ccdf8f5e9457b90a6a4d4b7a0fd1c065a132bd7c1dcb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.4/rtx-brew-v1.27.4-linux-arm64.tar.xz"
      sha256 "b9bbf8637757571c2ed783b269d022ee396ad290569ca614725e683f39278350"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.4/rtx-brew-v1.27.4-linux-x64.tar.xz"
      sha256 "15d2b88108c1db9fe58c4452d32d12c16be54b537b64a5700cd89b9ba8f37d59"
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
