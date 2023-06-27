class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.32.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.1/rtx-brew-v1.32.1-macos-x64.tar.xz"
      sha256 "e8fc9d3091a1c8d953c825eb2a4ce1ed163b2d7d9764735ea3ed789d4b20d34d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.32.1/rtx-brew-v1.32.1-macos-arm64.tar.xz"
      sha256 "cad1dcdf0651fd58800dd745a969e7f4972ce2d91cfbd4dff13e73c7fd2f2158"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.32.1/rtx-brew-v1.32.1-linux-arm64.tar.xz"
      sha256 "6940e244dfc2294054cbbddebd9c49aaa6ca54ff830c2088e7b57d27e394f62f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.1/rtx-brew-v1.32.1-linux-x64.tar.xz"
      sha256 "e2278c70b3f27b37fffe876be9b0666f38adefc6b8aca0a45da6c3af931d3059"
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
