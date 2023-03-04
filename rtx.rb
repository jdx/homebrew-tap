class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.2/rtx-brew-v1.21.2-macos-x64.tar.xz"
      sha256 "8eacaa25a27b58f0a6581c824dfca52b960ec78c83ff5000bdfbd6a2787de0ae"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.2/rtx-brew-v1.21.2-macos-arm64.tar.xz"
      sha256 "aa563362028a0b54ba8f628839deaec222ab7d5fc3a57e6c7392168cf0d61388"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.2/rtx-brew-v1.21.2-linux-arm64.tar.xz"
      sha256 "8560b5e862d749f81927d2656831648c4e3e739ea05cc2e24e950e04bfdb748c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.2/rtx-brew-v1.21.2-linux-x64.tar.xz"
      sha256 "5643688929cc18277343824df8dab9777f385ac8774249e37f64e8cc6468492c"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "complete", "--shell")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
