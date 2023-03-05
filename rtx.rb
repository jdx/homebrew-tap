class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.1/rtx-brew-v1.22.1-macos-x64.tar.xz"
      sha256 "5e439fb3f1efafb0cf4b32234cff991a28b4cbe768255cf642f3904cb199d26c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.1/rtx-brew-v1.22.1-macos-arm64.tar.xz"
      sha256 "5a9891f0108c971817996043b8814f356d9976b67982dd9165950db15a1ceb42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.1/rtx-brew-v1.22.1-linux-arm64.tar.xz"
      sha256 "e2c72b74b3517a3cd2439de37e63a735ca43c43fe5e365d5bddade444136cd3d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.1/rtx-brew-v1.22.1-linux-x64.tar.xz"
      sha256 "ae15a4fcc7200e10c1685e4a7d6a4ca33e1b04b0659518af42d0384bafd9ce0c"
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
