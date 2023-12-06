class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.9/rtx-v2023.12.9-macos-x64.tar.xz"
      sha256 "5bc8b6abad2ac10f6516a2b2e5f8aba8292d13b177e6c8d96bcff0399d230220"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.9/rtx-v2023.12.9-macos-arm64.tar.xz"
      sha256 "42b01db2fc2225c05cb7463958b19486a9aa2cfb172dcbf3dfa30cec2185ebed"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.9/rtx-v2023.12.9-linux-arm64.tar.xz"
      sha256 "22693c354b41d42661990abd9d2cef60a244be5ca7a53c470952dcce1ad586cf"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.9/rtx-v2023.12.9-linux-x64.tar.xz"
      sha256 "c5f3b98161877e12a25a4c78e85ae33cf042fcd855c0ff0bcf86394e6f5b1886"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
    lib.mkpath
    touch lib/".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
