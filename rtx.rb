class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.18.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.1/rtx-brew-v1.18.1-macos-x64.tar.xz"
      sha256 "4dff4d12ae4bdcf0bd6775c7ced0529e06f5ba3c1f87d8bf9dfb8ddba05cce03"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.18.1/rtx-brew-v1.18.1-macos-arm64.tar.xz"
      sha256 "34300536b01deeb4fb6ad63cb83f99dbd1a3c2123a111e5a51f0bf681d5debe1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.18.1/rtx-brew-v1.18.1-linux-arm64.tar.xz"
      sha256 "1b7b049496b8cc058d746fda804deaff86721a9aa77dd0e4ddee9741daabfa1c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.1/rtx-brew-v1.18.1-linux-x64.tar.xz"
      sha256 "163fd139e84a78d54d02ecdfcc14be8219a39a8263a2ddb7acf6e8ed59a279a8"
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
