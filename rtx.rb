class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.5/rtx-nonup-v2023.11.5-macos-x64.tar.xz"
      sha256 "e452143efc364a033fa136a1d4ff4271831f585de8544a8c85e91b96fecd9758"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.5/rtx-nonup-v2023.11.5-macos-arm64.tar.xz"
      sha256 "7b21774b893a40effa8e61585a3255490a7bf0bc4cdcb7e9752c986fcc853642"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.5/rtx-nonup-v2023.11.5-linux-arm64.tar.xz"
      sha256 "874d851b6e4531b3a50b9bdc2dd4d4e6f45e56a84a0c81dba29a5134635f6cf8"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.5/rtx-nonup-v2023.11.5-linux-x64.tar.xz"
      sha256 "fa093338fda77625b30bb0cb73b4b91bc4ebae2dfe6d658a14e7131fa9a96cee"
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
