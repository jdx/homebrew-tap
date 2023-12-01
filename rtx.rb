class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.1/rtx-nonup-v2023.12.1-macos-x64.tar.xz"
      sha256 "28c49d442c990d9879c88c14d9322d415bddc546381df5fb740b7d8df09f45d0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.1/rtx-nonup-v2023.12.1-macos-arm64.tar.xz"
      sha256 "797a628171338ece37bbb41ba4f7aa7020d5f6831ff63f12800d2153398209ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.1/rtx-nonup-v2023.12.1-linux-arm64.tar.xz"
      sha256 "3369163f166c038d3958d680daf4a3dd746c03d3c82c9feb038a6c3e20fa3dc9"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.1/rtx-nonup-v2023.12.1-linux-x64.tar.xz"
      sha256 "d5291ff49089652ec67b465fa3d0f86f738284bbb88603f7cd168a9d047962d1"
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
