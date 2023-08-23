class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "2023.8.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.6/rtx-nonup-v2023.8.6-macos-x64.tar.xz"
      sha256 "ea9dfd28986ca46729cfb5dd88b29f8509281c5dc23d948160ec40e47a8ea55d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.8.6/rtx-nonup-v2023.8.6-macos-arm64.tar.xz"
      sha256 "fd9f42e1228fc16c2aa9f2442e41ec0e9c54825d5f416270d9123e717f4ffa14"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.8.6/rtx-nonup-v2023.8.6-linux-arm64.tar.xz"
      sha256 "e438e1b2798d1467b3ce8e6a88986c7476d66f0d1abbe17a0878746120722bac"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.8.6/rtx-nonup-v2023.8.6-linux-x64.tar.xz"
      sha256 "4417e83f27301e7276a6b4e79437d388147ae43ccb40e92c31edc395e775e762"
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
