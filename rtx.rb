class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.20.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.3/rtx-brew-v1.20.3-macos-x64.tar.xz"
      sha256 "c54e802b887fa1210eaf48ad226dea731c56bbb08e02b812c634d3a4b9195bbb"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.20.3/rtx-brew-v1.20.3-macos-arm64.tar.xz"
      sha256 "7ac464134d2b8fd9ae0aeabdad86139cb8695dc0584392a8f74b3ae7353d085d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.20.3/rtx-brew-v1.20.3-linux-arm64.tar.xz"
      sha256 "a51bd6134427017c14e21aafbc6bd74b54460718c84e85b5a50dad29229a90e0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.20.3/rtx-brew-v1.20.3-linux-x64.tar.xz"
      sha256 "cc8880abad9c6621f625528b0b2232f4f606cc909905fd24647d04020dc44d42"
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
