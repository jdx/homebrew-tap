class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.30.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.1/rtx-brew-v1.30.1-macos-x64.tar.xz"
      sha256 "9fe9f55f7f73ed8269e85871d1e8585b3100766ee2eb5c14a5a3597274fa4e18"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.30.1/rtx-brew-v1.30.1-macos-arm64.tar.xz"
      sha256 "0fb5c6329f0cea9195a4b0c0ccc0da2c67cf31e5e6db9aa7dd911f46ddacba69"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.30.1/rtx-brew-v1.30.1-linux-arm64.tar.xz"
      sha256 "983838c3b63dcd766ec539be2398a750841d0030808a53ab1796bda7f153f79a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.30.1/rtx-brew-v1.30.1-linux-x64.tar.xz"
      sha256 "e8d75a6b5784687a449129813e33125f98b578250fad4b08e74cbb82351be3d6"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
