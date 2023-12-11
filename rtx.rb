# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.23"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.23/rtx-v2023.12.23-macos-x64.tar.xz"
      sha256 "a5c2bd456ecb9d60128ade293c8af7427551b158afb762b4399399a768445b76"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.23/rtx-v2023.12.23-macos-arm64.tar.xz"
      sha256 "905e1ca1bf238dadd1e0da514f1c38302b6aa375cdc268cd0e27fa29d3ef6a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.23/rtx-v2023.12.23-linux-arm64.tar.xz"
      sha256 "10f3edddea02012963f51b9904928cb912ecdc5e448623005693c0bbf16e250d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.23/rtx-v2023.12.23-linux-x64.tar.xz"
      sha256 "3b2b3cf0c1fb397539e987269130af5afe0136ed84942966d01c50e8bc245d12"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    share.install "share/fish"
    generate_completions_from_executable(bin / "rtx", "completion")
    lib.mkpath
    touch lib / ".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
