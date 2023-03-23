class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.1/rtx-brew-v1.27.1-macos-x64.tar.xz"
      sha256 "6a7cc5af9196cece097b2c965d1f76aba58962493dc0692cdd5e99d81c934de2"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.1/rtx-brew-v1.27.1-macos-arm64.tar.xz"
      sha256 "712cf6e2ae59129987799f78d1e1f0800fd22a19ce8330a0765ca4b91c319a42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.1/rtx-brew-v1.27.1-linux-arm64.tar.xz"
      sha256 "f136d282b8eb89bbab2f0e034baca23d42cb109885c1f98f8671410fce8632fc"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.1/rtx-brew-v1.27.1-linux-x64.tar.xz"
      sha256 "4bec741c90068af8785d68746f9d3dd4d4044f71164549acb2d079cc4649faa4"
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
