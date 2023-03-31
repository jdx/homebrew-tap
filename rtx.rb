class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.10/rtx-brew-v1.27.10-macos-x64.tar.xz"
      sha256 "4274e4b7986d9b8e656f4af3c00fae3d84596b6f1b547140a3dd8980c92a2c8a"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.10/rtx-brew-v1.27.10-macos-arm64.tar.xz"
      sha256 "0b52a1cf987b3324c7ca2549f1c3de1aef1ee1ffb0299a6a262f836ca1863d94"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.10/rtx-brew-v1.27.10-linux-arm64.tar.xz"
      sha256 "80d6d578ed758ccfab86e6bb2b593758bc16f7a00cbe5df02156af736e80b85a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.10/rtx-brew-v1.27.10-linux-x64.tar.xz"
      sha256 "3fe0c651f89d19ff7119cd0d62911cab5c240a48e845eb6d89246825b24e6c1f"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
