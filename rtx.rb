class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.32.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.0/rtx-brew-v1.32.0-macos-x64.tar.xz"
      sha256 "75e4f152ea92ccf39e5caf6ff7eb54d455444348aa21a2f0f697dc7402187479"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.32.0/rtx-brew-v1.32.0-macos-arm64.tar.xz"
      sha256 "c169774b9695a4281b62ffe9ff18a25b13632d22410a1184f881a9ffd9e345c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.32.0/rtx-brew-v1.32.0-linux-arm64.tar.xz"
      sha256 "92f8c2693e14c403bcbd44a36f8d5f21480f00897c00782095012b2cb6e1f196"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.0/rtx-brew-v1.32.0-linux-x64.tar.xz"
      sha256 "f307af12115ebe5c8e61922c1e26fa6b2e35e2e1db27248347f156616af4d50d"
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
