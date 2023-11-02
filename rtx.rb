class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.0/rtx-nonup-v2023.11.0-macos-x64.tar.xz"
      sha256 "d501c095ec81df2bda7fc5a4802c2caf0eb0399579049eedb5c2acaf7bee295f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.0/rtx-nonup-v2023.11.0-macos-arm64.tar.xz"
      sha256 "6d18ea933502bc168ab56ce195f40d9c86eb3b68b10e96f57464e5f391e549ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.0/rtx-nonup-v2023.11.0-linux-arm64.tar.xz"
      sha256 "7d43278132310f72e41e18a3b9086bc8832326279a6252f3aa9906d4240fe495"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.0/rtx-nonup-v2023.11.0-linux-x64.tar.xz"
      sha256 "9e39cfd098eae2a9d0411bf9bec277ab35bf4083f3d23f955754746046865df1"
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
