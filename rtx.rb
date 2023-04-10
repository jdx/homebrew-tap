class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.3/rtx-brew-v1.28.3-macos-x64.tar.xz"
      sha256 "537e97603471848164e9afdfba74f161972e149b6e24e4af82ac4916605c49d9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.3/rtx-brew-v1.28.3-macos-arm64.tar.xz"
      sha256 "a388559979bf17b0c20f953db8d98512be4d7c8dca05c248c781f02ef38396c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.3/rtx-brew-v1.28.3-linux-arm64.tar.xz"
      sha256 "c35426628ce1836e711eaeb2ba7ad05748840064c3b81fc77d4fa7d518df8652"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.3/rtx-brew-v1.28.3-linux-x64.tar.xz"
      sha256 "71877d484d3e1bf9d8b334f94841dfb0b12570e108944cee7a08f1a5c0020dde"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
