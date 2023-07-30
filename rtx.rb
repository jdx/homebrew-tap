class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.35.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.6/rtx-nonup-v1.35.6-macos-x64.tar.xz"
      sha256 "7c329eb043294060ba15968b97981efc75148d7ebc21dd4e8b47922467e2abe9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.35.6/rtx-nonup-v1.35.6-macos-arm64.tar.xz"
      sha256 "e28bc17ded259fa8d78bd4ee35c90b169601f6a78d61a06cfa6142de87645982"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.35.6/rtx-nonup-v1.35.6-linux-arm64.tar.xz"
      sha256 "fe2f08ad29492888ec7b2eae2d37dc7d350d8c5692db4426dbcd26533c098f9f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.35.6/rtx-nonup-v1.35.6-linux-x64.tar.xz"
      sha256 "5c5cf5ce34d65d4c046723b1c2001c3b3f946980cb05bfcb8d2a52abeda563a5"
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
