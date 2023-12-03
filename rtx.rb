class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.5/rtx-nonup-v2023.12.5-macos-x64.tar.xz"
      sha256 "1fe4e5e8dec8e7e2a2bd4137e61b8392291652f9baeb27e0cad997272dd09649"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.5/rtx-nonup-v2023.12.5-macos-arm64.tar.xz"
      sha256 "e31d752efb2234b4d1d7162e80117159f6fdf1b6f387d9a143e851c953b01bd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.5/rtx-nonup-v2023.12.5-linux-arm64.tar.xz"
      sha256 "601d84ee840c07f91da740ff7a2038ad3db10f1988335ade6282c1e5fa54456a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.5/rtx-nonup-v2023.12.5-linux-x64.tar.xz"
      sha256 "4bda64e9f8ea87b1059ef997875dfd1e3c9293f37ff80a92e23f596080f2dcc9"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
