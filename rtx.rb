# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.39"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.39/rtx-v2023.12.39-macos-x64.tar.xz"
      sha256 "bfed9b7651f7107dcb3109758e9906da2d5442302ef969fc5780113d33877071"
    end
    if Hardware::CPU.arm?
      url "https://rtx.jdx.dev/v2023.12.39/rtx-v2023.12.39-macos-arm64.tar.xz"
      sha256 "2e5cc8fc9681145cc5e12b62c08e4326b2b8d7c8b9bdd9b7796284aa926453fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.jdx.dev/v2023.12.39/rtx-v2023.12.39-linux-arm64.tar.xz"
      sha256 "a439a6848c1d3aa03b604d6679c76abfc0f458f7b03a3f9b2d515fd2de80baea"
    end
    if Hardware::CPU.intel?
      url "https://rtx.jdx.dev/v2023.12.39/rtx-v2023.12.39-linux-x64.tar.xz"
      sha256 "30631635ef2bdd4a03842590eae8b0f817b2797e6b72ac82085c08f1248e7098"
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
