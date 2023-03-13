class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.5/rtx-brew-v1.23.5-macos-x64.tar.xz"
      sha256 "113a3e8789aff420c5ca8af572e0057dfff8358465b604ecb84a702d91d7612d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.5/rtx-brew-v1.23.5-macos-arm64.tar.xz"
      sha256 "587e1871b10310659522c90bc5c319608712d1ad4bcfb6d5911529b1f73afc64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.5/rtx-brew-v1.23.5-linux-arm64.tar.xz"
      sha256 "3b0f8abfedda1c6a26ba284afa27d8ad42a48ba31d9fdcc535cabedcb2344c4e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.5/rtx-brew-v1.23.5-linux-x64.tar.xz"
      sha256 "8a38e5a0b0a23afd3d9b43c0b147f8336a5610801ba987eec8a479b79b89806a"
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
