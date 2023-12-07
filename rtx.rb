# frozen_string_literal: true

class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.18"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.18/rtx-v2023.12.18-macos-x64.tar.xz"
      sha256 "548b1f2bacb30b684fc317340940fef6a97d37554660faa902daf723cd6e19a0"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.18/rtx-v2023.12.18-macos-arm64.tar.xz"
      sha256 "3916c97152fb01b472c7467d08ba4cc3516aecc4421aa8cc596913179121e8c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.18/rtx-v2023.12.18-linux-arm64.tar.xz"
      sha256 "165df63365b507987a924273136f56f28efd20920d0579ec7679172e39fb23af"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.18/rtx-v2023.12.18-linux-x64.tar.xz"
      sha256 "eed0854b034f861d6dbf0e20386d4b15f3b93af17abd1c7326238cb7d4451c33"
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
