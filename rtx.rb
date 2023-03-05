class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.2/rtx-brew-v1.22.2-macos-x64.tar.xz"
      sha256 "ae9b39a3ea849fedf0dbb69cc719d5f9dac1426c3252f92816f67e7e3dcc4663"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.2/rtx-brew-v1.22.2-macos-arm64.tar.xz"
      sha256 "b785f482166ec93127f7bba160242b987fda8cc4f16caaf8a3e18692b3eda7ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.2/rtx-brew-v1.22.2-linux-arm64.tar.xz"
      sha256 "548fff0833301680f3b1487895be8315c35cbbd12e97e05c6fc267497c1b26ab"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.2/rtx-brew-v1.22.2-linux-x64.tar.xz"
      sha256 "18635bc2289a46561499a4be39342fc9405a1a108e02ad48d11b5696c81b7bbe"
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
