# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.20"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.20/rtx-v2023.12.20-macos-x64.tar.xz"
      sha256 "7ab7741127978b6af57bb0fb810b035b3f2955d8852c942e34200d347ad91e40"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.20/rtx-v2023.12.20-macos-arm64.tar.xz"
      sha256 "87f547a9a7644f4fe0ed15e46fc414b60728f7dd912ef258913aeb5510f39053"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.20/rtx-v2023.12.20-linux-arm64.tar.xz"
      sha256 "37c442f0fc83d8eedcaf227c30ff3eba23d4f7a61210f7ec4706eb3f9fe7ff1a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.20/rtx-v2023.12.20-linux-x64.tar.xz"
      sha256 "be7102c5216780171f9fab5397bffd2b292224de048b1bef60a8386266277964"
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
