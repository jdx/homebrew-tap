class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.11/rtx-brew-v1.27.11-macos-x64.tar.xz"
      sha256 "2a05f17493b067fbbd1a23c478af20851764387f55c0a197834264b3991ba17c"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.11/rtx-brew-v1.27.11-macos-arm64.tar.xz"
      sha256 "cce04be5d9daa2e91916924a54c39fe0e667d9ea9d38771abfc70e69bbb2d02d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.11/rtx-brew-v1.27.11-linux-arm64.tar.xz"
      sha256 "9b6d97c74617e27e9db8669211a7757beb2fdf59d8eb16ec1584e88773210d0b"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.11/rtx-brew-v1.27.11-linux-x64.tar.xz"
      sha256 "2a0eb73cec6e59b315c84a90e2f9400217c7a12f63e756fba34bc5c9d4c02f95"
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
