class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.24.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.24.0/rtx-brew-v1.24.0-macos-x64.tar.xz"
      sha256 "eade9205bb8cd507048a020540b62afe3430cfcd6346f13ed91c4f444e7b3b3b"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.24.0/rtx-brew-v1.24.0-macos-arm64.tar.xz"
      sha256 "091b7d43f00eefecea4f3a386bbffde4298a42610c6eaefc89b50946e4293b4c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.24.0/rtx-brew-v1.24.0-linux-arm64.tar.xz"
      sha256 "d69d91ff88dad422b6800ff3a867185de5f488a56399f05ead8b73da7b5bc9f1"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.24.0/rtx-brew-v1.24.0-linux-x64.tar.xz"
      sha256 "e4c77614b46053c5a7d68cc1e5ea6717517c018ddac76a4d79d6cfdd047f0f3e"
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
