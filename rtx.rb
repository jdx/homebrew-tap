class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.33.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.33.0/rtx-brew-v1.33.0-macos-x64.tar.xz"
      sha256 "0bf0e5ec1ce689746e0cfd6e7eb2702132823c1e6ea00fb7c0dcda222ca73508"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.33.0/rtx-brew-v1.33.0-macos-arm64.tar.xz"
      sha256 "47afdfec1b9a6bded2ebaeaaf0fba23b1f97c9a84b7983f041a1226eb0fb0f31"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.33.0/rtx-brew-v1.33.0-linux-arm64.tar.xz"
      sha256 "c54f8d53a772f3dabb0b34c50c9f03dd659727c41eae093387eee945c267643e"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.33.0/rtx-brew-v1.33.0-linux-x64.tar.xz"
      sha256 "6f3d0ec70dd20b2103893243caa4e7ae9f66929c78a5eebd2e8db746dbecc48e"
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
