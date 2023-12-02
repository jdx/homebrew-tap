class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.2/rtx-nonup-v2023.12.2-macos-x64.tar.xz"
      sha256 "aaa542bd0cedb7a2653c137fdd4e8b7474294562a7af6c2861b0485a6680ed11"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.2/rtx-nonup-v2023.12.2-macos-arm64.tar.xz"
      sha256 "15248f317a39c62e018249b13c501e8e4b94cac3b2196a940d45ee25aa6a2163"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.2/rtx-nonup-v2023.12.2-linux-arm64.tar.xz"
      sha256 "d2b46a13309b6340895211489d7b2bb1159e8e7ee399a38e3b2ba2515e0157ad"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.2/rtx-nonup-v2023.12.2-linux-x64.tar.xz"
      sha256 "f8fda950717224ebd4017dd395e1cf10b782596d4d185282dd9b9329ef0f10be"
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
