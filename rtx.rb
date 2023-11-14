class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.3/rtx-nonup-v2023.11.3-macos-x64.tar.xz"
      sha256 "f1096d94b7007513401662f0bc9a5a56e31c08ccdc515a6401201ea0d284be21"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.3/rtx-nonup-v2023.11.3-macos-arm64.tar.xz"
      sha256 "3e6c73f479cb5deb228a5458315c632537363749b4878efc3acd5215cdca4cb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.3/rtx-nonup-v2023.11.3-linux-arm64.tar.xz"
      sha256 "10b9bd993aef0337e49cb146f765f56b99bc1db407bef9cac595584e2c4acca3"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.3/rtx-nonup-v2023.11.3-linux-x64.tar.xz"
      sha256 "01f8ca5e58f5e89cf5759950369db3c39b14166057ea8d16bf41d9dedfc538c1"
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
