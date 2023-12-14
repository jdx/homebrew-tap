# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.27"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.27/rtx-v2023.12.27-macos-x64.tar.xz"
      sha256 "11ba8a432fbc49e7ae02c9c173809d4d41b797bb892c31f1444b078d387d2f1f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.27/rtx-v2023.12.27-macos-arm64.tar.xz"
      sha256 "bbfe237fdbe2b83e1e45e5f83a5ccbf1dcdf4304a5c2dba41975411dc39f2879"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.27/rtx-v2023.12.27-linux-arm64.tar.xz"
      sha256 "5bf7e59587042317e0bde09de2e67ebdbb1290b64fc0eadc5a31a47897ccb63f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.27/rtx-v2023.12.27-linux-x64.tar.xz"
      sha256 "9727cb6961918430d1b9dbc9b286294975be5b40178d81910aa5b5acbb8d4e53"
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
