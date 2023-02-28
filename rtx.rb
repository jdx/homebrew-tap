class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.19.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.19.1/rtx-brew-v1.19.1-macos-x64.tar.xz"
      sha256 "da1f09e731f8cead92b767e30f47f8713a2123241bb02099ab9c7b29471c7fe9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.19.1/rtx-brew-v1.19.1-macos-arm64.tar.xz"
      sha256 "260c9426c9390d06fb688b5ac609329e00031e1c2a1e4b7207db65eb1e7d0295"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.19.1/rtx-brew-v1.19.1-linux-arm64.tar.xz"
      sha256 "b992039143d177489e9546ae8df6d433bbfe207a8d86409cdfcac2def65918d4"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.19.1/rtx-brew-v1.19.1-linux-x64.tar.xz"
      sha256 "9bfb92596af3e82b2f227c836f16f0380f4e7e37799326936b8ab272edb22466"
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
