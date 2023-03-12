class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.2/rtx-brew-v1.23.2-macos-x64.tar.xz"
      sha256 "ee4141aa4ba406bf1fffedd8fd1e8d9233db62a96197ce0a25ea802e6a80b6c1"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.2/rtx-brew-v1.23.2-macos-arm64.tar.xz"
      sha256 "049b2ea6c2846bdcebecfb020dd0093e37659c87124ae1fe6a2379237d0ea807"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.2/rtx-brew-v1.23.2-linux-arm64.tar.xz"
      sha256 "8cab9f5c9b745623a6beca72207e0f8443060263fafa7ce5679ffb4681548433"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.2/rtx-brew-v1.23.2-linux-x64.tar.xz"
      sha256 "9176b514c56fd56d9b8d84989bbf06fc2e237ba1007600f7fca1afcabeb639d2"
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
