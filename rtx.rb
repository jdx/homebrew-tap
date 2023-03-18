class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.25.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.4/rtx-brew-v1.25.4-macos-x64.tar.xz"
      sha256 "ee48a8eda2c275392c4768bb9d40f8f3290997945a50a97977b9197f9dd31d77"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.25.4/rtx-brew-v1.25.4-macos-arm64.tar.xz"
      sha256 "a89cb87bfe70dc1897f140f4cbf9e34b2d42749826ffb9c5e1a871d5960bca21"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.25.4/rtx-brew-v1.25.4-linux-arm64.tar.xz"
      sha256 "e93f16093c0d92c2ee88ab5be2af670f626d31eb6cf92ad9038c9b9c8d8fdb4a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.4/rtx-brew-v1.25.4-linux-x64.tar.xz"
      sha256 "552e325f53b530a6fcc4221c40c6f60e798c8e83aab9a41eea81ba83fdf28732"
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
