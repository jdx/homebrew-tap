class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.9/rtx-nonup-v2023.11.9-macos-x64.tar.xz"
      sha256 "14093f687062463a78c31ef556d06911568c77bead3b109c13bc4ffa35c05998"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.9/rtx-nonup-v2023.11.9-macos-arm64.tar.xz"
      sha256 "1c7fdba9df999af32efb9c138a532de2b5cd20ad8c09fd5dc89c95344cfa59e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.9/rtx-nonup-v2023.11.9-linux-arm64.tar.xz"
      sha256 "5cfb2fd625d4f6245f6b231a50eb1d5cb0960cc54500ac1920f0594a4ec305bf"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.9/rtx-nonup-v2023.11.9-linux-x64.tar.xz"
      sha256 "59aa5fe086056bc16bf7ec1c292726dee0a8abf7f631adca2d8b7de80715b108"
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
