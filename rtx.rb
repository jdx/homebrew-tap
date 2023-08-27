class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.8.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.9/rtx-nonup-v2023.8.9-macos-x64.tar.xz"
      sha256 "7bf609609fdfd29ea167c5d0cac0521fa57c39e11a8404f78a87ab9339408e19"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.9/rtx-nonup-v2023.8.9-macos-arm64.tar.xz"
      sha256 "0e60afdf916f4196b8e87ed57bcfc09b47f58e828b73bda7ce085e6b9297fd83"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.9/rtx-nonup-v2023.8.9-linux-arm64.tar.xz"
      sha256 "1977090d55adf5e588b672109c336d9bef9211f3546034b27294e911772b6fd0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.9/rtx-nonup-v2023.8.9-linux-x64.tar.xz"
      sha256 "cbfba768e275b5398b8658bf02f3b0af589b0d0262f7d5bcb08f42aad0c8aea9"
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
