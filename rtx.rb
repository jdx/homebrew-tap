class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.1/rtx-brew-v1.28.1-macos-x64.tar.xz"
      sha256 "19df22c8b45424bacc1aead1c85dde6ade973b14c2fc72b62c86ec83dde510df"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.1/rtx-brew-v1.28.1-macos-arm64.tar.xz"
      sha256 "05eb5924586c2f601bc74bcecc68394db8f9aa4fe98ace04a03a1128d87c0f41"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.1/rtx-brew-v1.28.1-linux-arm64.tar.xz"
      sha256 "ca7c92e415ecd97d05b5050d55017cff15a381aef97481d566134dfbb0a4b511"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.1/rtx-brew-v1.28.1-linux-x64.tar.xz"
      sha256 "1a8d857cb2ff49a9ead6d90f6bd225c7261e8e87862cf3fa64478a1ae2177152"
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
