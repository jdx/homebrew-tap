class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.4/rtx-brew-v1.28.4-macos-x64.tar.xz"
      sha256 "8aec7913395ed2e339e24a3dad313694a7f9a2f283687e61cfcbf154e95468fd"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.4/rtx-brew-v1.28.4-macos-arm64.tar.xz"
      sha256 "7b5bd838d5bfc12f72e8141f5013d18377454593452dd7555761a3026f9f1f01"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.4/rtx-brew-v1.28.4-linux-arm64.tar.xz"
      sha256 "94f3386b3d878e8a4cdf94dbfe51c56a974da65ca2d62431bb89f483f1adbebe"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.4/rtx-brew-v1.28.4-linux-x64.tar.xz"
      sha256 "764478d677e48d11287f5c01bc2c000567993e4d6b8717a54c9ba0f0a74d2af4"
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
