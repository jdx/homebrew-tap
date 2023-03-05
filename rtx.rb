class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.22.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.0/rtx-brew-v1.22.0-macos-x64.tar.xz"
      sha256 "5e3fa0d32902a17fe408ca96c192a81beec3831f785e5737823ba4ae0762ab8d"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.22.0/rtx-brew-v1.22.0-macos-arm64.tar.xz"
      sha256 "2d7a634e55ea230153dd0c1e6aaba4e8486444739376976eeafe6e99b5a11173"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.22.0/rtx-brew-v1.22.0-linux-arm64.tar.xz"
      sha256 "f7023373f4d29e4da1ee163e4d775ce8043d60b6f004b9dc503c89f92e4f18e9"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.22.0/rtx-brew-v1.22.0-linux-x64.tar.xz"
      sha256 "5933380cceed4ad617a6854d161be1acbddfe5aa808d1a0353845f30e7200bf8"
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
