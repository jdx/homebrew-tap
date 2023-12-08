# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.21"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.21/rtx-v2023.12.21-macos-x64.tar.xz"
      sha256 "31edfb3d38a90999ac49bd09de53bf525abea15435e17c4be0948bbde5614b0f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.21/rtx-v2023.12.21-macos-arm64.tar.xz"
      sha256 "c3bbc4e05d83268281a3569e0d27fe867dc460f49017e03fe1e2b345954def37"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.21/rtx-v2023.12.21-linux-arm64.tar.xz"
      sha256 "d5d4d1d9aacdeeafb717d53ed863a517f8de6aa7e1b9223d185698d7b2468713"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.21/rtx-v2023.12.21-linux-x64.tar.xz"
      sha256 "2fb6dab4b38f9b83bfd4ed62a6e3829808427de666515bbd08d2713669aecaa0"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin / "rtx", "completion")
    lib.mkpath
    touch lib / ".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
