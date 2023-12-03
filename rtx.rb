class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.7/rtx-v2023.12.7-macos-x64.tar.xz"
      sha256 "ab0dffaa9bf2954cc17da27b958f47d215b203214e8055f406abe4dc639b2bd4"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.7/rtx-v2023.12.7-macos-arm64.tar.xz"
      sha256 "485983b4767c37a96f0d99e20d2657d0935089007477b74b5cf60c4a3678dc65"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.7/rtx-v2023.12.7-linux-arm64.tar.xz"
      sha256 "3b087802e0d534c14f8d807c1c1791abcb846c8cab594a26bcc821d4be88b4aa"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.7/rtx-v2023.12.7-linux-x64.tar.xz"
      sha256 "26fa333823dd91412ff40e50072e216884ab9ba52fa762131fa4ad56172afdc5"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
    lib.mkpath
    touch lib/".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
