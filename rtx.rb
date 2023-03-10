class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.7/rtx-brew-v1.22.7-macos-x64.tar.xz"
      sha256 "1b1041d71f812a3fca34fc0a703ce4118555776dcf8ed9dbceab100bd5e0398d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.7/rtx-brew-v1.22.7-macos-arm64.tar.xz"
      sha256 "1a237952329e728f0cecc92610e1dd700dbebd206e07e7327c7f7c4009bfc53b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.7/rtx-brew-v1.22.7-linux-arm64.tar.xz"
      sha256 "d409ff8489060c35ca9204977a9af904d51a5c3fd352d26c1806d24f92ab8554"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.7/rtx-brew-v1.22.7-linux-x64.tar.xz"
      sha256 "4b7a019737f17c0c941a2bf07c10b31b1ad5f90ab99eb4079054d7815bc04610"
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
