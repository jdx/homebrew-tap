class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.27.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.9/rtx-brew-v1.27.9-macos-x64.tar.xz"
      sha256 "76123fcd5700a1823d4dc2e866049709b36c14d65a90ecd891cb369bf0fd881f"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.27.9/rtx-brew-v1.27.9-macos-arm64.tar.xz"
      sha256 "2e1d83504ffe20251744fbc2ee6ca40230a8a4f487eda17dc3fedc207bd9ff5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.27.9/rtx-brew-v1.27.9-linux-arm64.tar.xz"
      sha256 "bbc7ce47e17142b039f3597c4b48e2baaecab40b8d6648ed658426beed9f9aae"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.27.9/rtx-brew-v1.27.9-linux-x64.tar.xz"
      sha256 "b668aa9678416879f18a9241860c2e30881cf136fde6a9d5a4fb8342d038a566"
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
