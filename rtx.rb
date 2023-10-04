class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.0/rtx-nonup-v2023.10.0-macos-x64.tar.xz"
      sha256 "1d2c4d1985f37a961eac33c66ef03e33c082830908eb5bb031855e04c4419f52"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.10.0/rtx-nonup-v2023.10.0-macos-arm64.tar.xz"
      sha256 "529829f5052cf8bc24e8d1febcb7ca7caa0d26adfccf8accb6dc80e0bccdf901"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.10.0/rtx-nonup-v2023.10.0-linux-arm64.tar.xz"
      sha256 "d69067e58773a75db85d8d8aa6d664b68f26bd25255b9b408790665caa2d4071"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.10.0/rtx-nonup-v2023.10.0-linux-x64.tar.xz"
      sha256 "c5fe9e75b13a3103d5f62eb74b5751c40f1355fee307e8ff13886d767419d994"
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
