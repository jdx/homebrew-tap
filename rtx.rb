class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.6/rtx-v2023.12.6-macos-x64.tar.xz"
      sha256 "fa93dfa4cc864dec25b8662cbdfe5bb2c76e8ce2968d30ca4de58731b2dd3cac"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.6/rtx-v2023.12.6-macos-arm64.tar.xz"
      sha256 "11fcf76d809cea4a9c1e93338f2984059c988d166c356f198a59eaf6b8b6e8f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.6/rtx-v2023.12.6-linux-arm64.tar.xz"
      sha256 "3265cbc5d115fa7a333a307a1be04e3c72c38fba81054496eba8a0286c5e7278"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.6/rtx-v2023.12.6-linux-x64.tar.xz"
      sha256 "f4e7f0cbb7131289b612a6a65f507bd89ed165af71ac8417751ddef0bbf39ad6"
    end
  end

  def install
    bin.install "bin/rtx"
    lib.write ".disable-self-update"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
