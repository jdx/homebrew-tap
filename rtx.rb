class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.34.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.2/rtx-brew-v1.34.2-macos-x64.tar.xz"
      sha256 "fc7c5ce9b1b887963fbf635893fc7f629db5d3ccaca844e5709dcec4276162fa"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.34.2/rtx-brew-v1.34.2-macos-arm64.tar.xz"
      sha256 "3636ed85102c1703b8e92e56e5527957c3d6359dfe49387c88a72a9f4c5c920c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.34.2/rtx-brew-v1.34.2-linux-arm64.tar.xz"
      sha256 "f5e0a7a538cda116f0cd6a23948f64427e66731c3c26094a2c0294f7930d24db"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.34.2/rtx-brew-v1.34.2-linux-x64.tar.xz"
      sha256 "ce538e8d9fb8037cac6831c33156de79e101029d035e7df5b90376d425dad8dc"
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
