# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.29"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.29/rtx-v2023.12.29-macos-x64.tar.xz"
      sha256 "031ab8b322d89bb549bb94d72f08d09b6c9ed024876df27999bbb87cff1a79a9"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.29/rtx-v2023.12.29-macos-arm64.tar.xz"
      sha256 "cd6ba202ea343dabf1670fc2b65e1fe8a7b0c339899a8b6bd082dd92aa773b30"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.29/rtx-v2023.12.29-linux-arm64.tar.xz"
      sha256 "064bb8365afe308c739b6af1f7b3848a877c5511b68cd593bd14fac8c59fcec7"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.29/rtx-v2023.12.29-linux-x64.tar.xz"
      sha256 "6a635767c03f7812cfe105ea00d0b6e79c6ac0692176382472480b8240575a90"
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
