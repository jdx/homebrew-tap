class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.1/rtx-brew-v1.29.1-macos-x64.tar.xz"
      sha256 "30d03e6ae2ebe51f96c54b0a85603817e112963d2dc80fff96f73ebba11e6b63"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.1/rtx-brew-v1.29.1-macos-arm64.tar.xz"
      sha256 "510899cec053eee90bcbf38221c68b4e89a8b4a6a248d63fef99c59eb2f7b39a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.1/rtx-brew-v1.29.1-linux-arm64.tar.xz"
      sha256 "537fbfed98405a083bc06e93feee85ddfe96c5bf1e701a97001cfa6c4aca3ee8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.1/rtx-brew-v1.29.1-linux-x64.tar.xz"
      sha256 "cb55642dfa5aecb57a95ec66e7a063a5cf207b54a04cf7474e98ece45171a90c"
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
