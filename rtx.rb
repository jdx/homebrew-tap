# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.38"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.38/rtx-v2023.12.38-macos-x64.tar.xz"
      sha256 "90821d1eb616db17faedaf7a1c61bdc60ef4bb72792ee6e4b59aadf1552d4664"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.38/rtx-v2023.12.38-macos-arm64.tar.xz"
      sha256 "b69cb53b6996e9b48774958092d9e80ca5a81c9e0b5a2f929bd49230a6cf5bdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.38/rtx-v2023.12.38-linux-arm64.tar.xz"
      sha256 "a167347ff35554cf8e33d94465e8a2732a66aa5b09f83cbeda803bdfb3fe6375"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.38/rtx-v2023.12.38-linux-x64.tar.xz"
      sha256 "3329e0b16a82c59fb42b0ba9f81ae7be89c2a804011845f73ce7b0f77fa12365"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    share.install "share/fish"
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
