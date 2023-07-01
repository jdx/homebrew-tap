class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.32.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.2/rtx-brew-v1.32.2-macos-x64.tar.xz"
      sha256 "40321647156ec4bde2f72b49d7a14af6d4e14b0f26cd183af328802fee493ea1"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.32.2/rtx-brew-v1.32.2-macos-arm64.tar.xz"
      sha256 "041d1788c546daff61a22f73082b991c3ffb49b68281eac59ce1b7f28e76ad4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.32.2/rtx-brew-v1.32.2-linux-arm64.tar.xz"
      sha256 "aaa7676ac9ea249cb09b32d3322b863a2172d396b1ac55b2249bfcedf9a5d221"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.2/rtx-brew-v1.32.2-linux-x64.tar.xz"
      sha256 "632cae34ab64d2cc29a20b1dbd6164a08a1aaf0a57b5dea0f305dcc0596e8d55"
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
