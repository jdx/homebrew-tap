class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.10/rtx-brew-v1.23.10-macos-x64.tar.xz"
      sha256 "6e9bbb63a7b166295bc48a3ee07277fbe394e5c54cffea263a00b01d4626ba71"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.10/rtx-brew-v1.23.10-macos-arm64.tar.xz"
      sha256 "737a0366e6c71906a5575a4ec673f76cbdce6f6d2079b44261f016b724a4924f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.10/rtx-brew-v1.23.10-linux-arm64.tar.xz"
      sha256 "d7bd99a4891ca4d12a78dec8323bd2e0f6ede174293c6ae0e925f9a6f6b3cbc5"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.10/rtx-brew-v1.23.10-linux-x64.tar.xz"
      sha256 "152fea102167b8519183c80cd800303b753b0e816fbaf3af152934054f4acd10"
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
