class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.2/rtx-brew-v1.28.2-macos-x64.tar.xz"
      sha256 "684eff4c0ea62932248cae902df025f9771662616b27ccbc72636a35e74e8417"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.2/rtx-brew-v1.28.2-macos-arm64.tar.xz"
      sha256 "fb971f2f5bdfa9219576c88641cdfafefce91403a0689cfa9f6ddb7c55ad0d4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.2/rtx-brew-v1.28.2-linux-arm64.tar.xz"
      sha256 "0cd7de5934de248a76dbef0933b8c6ec30b47758446c8f95bd20544340f95469"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.2/rtx-brew-v1.28.2-linux-x64.tar.xz"
      sha256 "7c3fdf13f591f59946ee261821f451d017a980a66a9df883b828c36b61c32271"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
