class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.3/rtx-brew-v1.23.3-macos-x64.tar.xz"
      sha256 "59c6eacda2e67fd3b620217bd5101d7457a8f952d1172ee9e6959415b79f8d56"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.3/rtx-brew-v1.23.3-macos-arm64.tar.xz"
      sha256 "f004df904427a5155a3428b34c3a02dffe06bd9503651d0bd30c589c4935b4b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.3/rtx-brew-v1.23.3-linux-arm64.tar.xz"
      sha256 "1f3ffe3b2f142f412a41a28a1561e533ba978cb917fcac95526a94df2efb937c"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.3/rtx-brew-v1.23.3-linux-x64.tar.xz"
      sha256 "ea3727ae00f7ec9cea4b6cfde44be6b0842c740272dde33df2d4aaee75826209"
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
