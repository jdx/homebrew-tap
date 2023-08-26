class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.8/rtx-nonup-v2023.8.8-macos-x64.tar.xz"
      sha256 "e9adef1e3e8f76d1368b7c8467accae16f737bf779267c120b5e1dd0ef0bda09"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.8/rtx-nonup-v2023.8.8-macos-arm64.tar.xz"
      sha256 "30afd9c6a4af81faba7258f9c82f8a131cef4ff879d50ecacaba10d33587375a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.8/rtx-nonup-v2023.8.8-linux-arm64.tar.xz"
      sha256 "b384836e7f5cbba2d972cc8019042d5f0b069989c55239f2b5c5179be3af8151"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.8/rtx-nonup-v2023.8.8-linux-x64.tar.xz"
      sha256 "bf33c7ca1f507d449164a257bfbb776ba83ca63b76c15a434723e78f4439bee6"
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
