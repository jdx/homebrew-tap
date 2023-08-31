class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.8.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.10/rtx-nonup-v2023.8.10-macos-x64.tar.xz"
      sha256 "a830da62bafb59598611fa4991d584a407f52e196d9f6602325d86e3d96e1834"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.10/rtx-nonup-v2023.8.10-macos-arm64.tar.xz"
      sha256 "ac4d7b4795989702f7858c00a5913964b56a94ed95c1fa505aaefe42eed6fee5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.10/rtx-nonup-v2023.8.10-linux-arm64.tar.xz"
      sha256 "f95a644d73c883668a5b369a437ea21cdc557448e2a5902693a8acfac61a102f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.10/rtx-nonup-v2023.8.10-linux-x64.tar.xz"
      sha256 "2615c124e28e46d523f1c0b5404b0e5c92d5bcf85047dab6e606d7bedac0c9af"
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
