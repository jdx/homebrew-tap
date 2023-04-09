class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.0/rtx-brew-v1.28.0-macos-x64.tar.xz"
      sha256 "6026862c298b706b22a579c739912a6fb3c566951b36c1273017c3aee18083e0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.0/rtx-brew-v1.28.0-macos-arm64.tar.xz"
      sha256 "d79a110c9f3a2d9368537a62c1c43c12794722256caa589132e2b1fa7fe72b40"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.0/rtx-brew-v1.28.0-linux-arm64.tar.xz"
      sha256 "7ff777aa26ada444bf5361b5e12d15e749dea38d8415869c3be7b25b784cf9f8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.0/rtx-brew-v1.28.0-linux-x64.tar.xz"
      sha256 "30e79fd8ed690aa8969f8ef14df123631c5b87375df4e2880b5c0064d89cbb5a"
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
