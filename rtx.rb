class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.21.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.5/rtx-brew-v1.21.5-macos-x64.tar.xz"
      sha256 "42c669d4bc5f5273c163836dacc7916ca634cc8483a7b23cd393872d74f73e66"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.21.5/rtx-brew-v1.21.5-macos-arm64.tar.xz"
      sha256 "309ca8e24074d15d600b4d2a5b93299552123ad5cba71cd8598668f001140db9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.21.5/rtx-brew-v1.21.5-linux-arm64.tar.xz"
      sha256 "536005db3b0e0e2faa52e9024bf7a7a498ac60b349ccd5120b4c9f37973da2ca"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.21.5/rtx-brew-v1.21.5-linux-x64.tar.xz"
      sha256 "11031ba6c72288ffb7c4018794a77ecbc884bcebe9dad3fc847172cbe9e78ee5"
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
