class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.6/rtx-brew-v1.27.6-macos-x64.tar.xz"
      sha256 "5309dfdf54ee6d7da5bf59a7193eee0063d99d178998101d273b8cdc5560c599"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.6/rtx-brew-v1.27.6-macos-arm64.tar.xz"
      sha256 "fda5176be1d5c5b706275ec412373eedbb99ef778e29e3ee1d77daccda998447"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.6/rtx-brew-v1.27.6-linux-arm64.tar.xz"
      sha256 "48120704ab96b04eddacf168e4fb852584b6990cd56d5e22aa783c02b84cbe91"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.6/rtx-brew-v1.27.6-linux-x64.tar.xz"
      sha256 "10c07760bf3ebfb7c6fc4629afc65e54e45e1a1a9c0839c1093602b48c2345b7"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "complete", "--shell")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
