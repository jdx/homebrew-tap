class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.9.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.2/rtx-nonup-v2023.9.2-macos-x64.tar.xz"
      sha256 "ec8f1e71e43ed5099d11ad20e740fb00208162e8cb5f30f0222eb6a30efc0416"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.9.2/rtx-nonup-v2023.9.2-macos-arm64.tar.xz"
      sha256 "4368024e74bb8e15b1a26a0f90b13caefe5ef73bae396c324d586a89eec77452"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.9.2/rtx-nonup-v2023.9.2-linux-arm64.tar.xz"
      sha256 "77235f66160a467605f8f086deb679ee7ed78751276f2bacd41022fdfc5a1613"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.9.2/rtx-nonup-v2023.9.2-linux-x64.tar.xz"
      sha256 "c2cb32bc9d9f71c14523d7d57d1cbb3c9fe67719ea016de46caee5d90f1e75ac"
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
