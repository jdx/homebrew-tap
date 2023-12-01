class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.0/rtx-nonup-v2023.12.0-macos-x64.tar.xz"
      sha256 "cac02bbf07b01852e84395df7cf3f5f318b5256d94914f3f57f7b48b69afa2ac"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.0/rtx-nonup-v2023.12.0-macos-arm64.tar.xz"
      sha256 "f0e0e2860849295d787d8bec911f3fa54f76fda9e332c9770c6b29c0d232acf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.0/rtx-nonup-v2023.12.0-linux-arm64.tar.xz"
      sha256 "0ab3b15adb864ecdc25863cd801478526a72c2f49c745b62d44fb470c40a295d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.0/rtx-nonup-v2023.12.0-linux-x64.tar.xz"
      sha256 "cabb43fe7e6a60a567285c23a8305cef9967137f2524628d8eaa119947ff5d26"
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
