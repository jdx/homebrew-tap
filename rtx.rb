class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.7/rtx-brew-v1.27.7-macos-x64.tar.xz"
      sha256 "d560424df30f9f9d74e3b8566c8ff5f30f1a772cfd51a77ab9cf268967bc18d9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.7/rtx-brew-v1.27.7-macos-arm64.tar.xz"
      sha256 "6f95f21f18f052cbca5866b3f24ef3dd26396f21a5ebb1332b2344b761c9bcb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.7/rtx-brew-v1.27.7-linux-arm64.tar.xz"
      sha256 "809f304f88bc4340e29d2f553fc660392d0dc2954ad187235cedfeccf0a7bc94"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.7/rtx-brew-v1.27.7-linux-x64.tar.xz"
      sha256 "15ca5322e895e0ecbdac72d5027e95f0216c45b55557bd16697e01ecc528a925"
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
