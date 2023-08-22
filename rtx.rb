class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.3/rtx-nonup-v2023.8.3-macos-x64.tar.xz"
      sha256 "824eedefb626e740235c869e6a50900c0c5e594ae39d669f68adb1c47a87974d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.3/rtx-nonup-v2023.8.3-macos-arm64.tar.xz"
      sha256 "8865c62c283f8cb5096e06dd9dff8676d41fa11455c35a3844f2be65007dbcc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.3/rtx-nonup-v2023.8.3-linux-arm64.tar.xz"
      sha256 "c9270487ba8ada01a75f9b699d7a996a0eeaf3e6036b4292cb81e489e6f8262c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.3/rtx-nonup-v2023.8.3-linux-x64.tar.xz"
      sha256 "eea1fe72edb32f0143ddf5112295dd5268ff062cbb8028b9dadfe39812d039b6"
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
