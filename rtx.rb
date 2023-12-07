# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.17"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.17/rtx-v2023.12.17-macos-x64.tar.xz"
      sha256 "4a143841aa9b7f1be534cc08648756995e472e23d682e4c13a860ed3bdf9b68d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.17/rtx-v2023.12.17-macos-arm64.tar.xz"
      sha256 "b165ae7b97c92d67c76161440bd4db2ee33ce660bba63a4347ab0e32acc6478d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.17/rtx-v2023.12.17-linux-arm64.tar.xz"
      sha256 "4cc7ff55151de1c759d7c46c645bc2eda3ad44b3cec6655eef7e679eb800536f"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.17/rtx-v2023.12.17-linux-x64.tar.xz"
      sha256 "b452d7eb29e5058a7452e58e9e5ec7cf03842c809727ac5deb1b7d9e10c1b4be"
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
