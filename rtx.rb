class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.18.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.0/rtx-brew-v1.18.0-macos-x64.tar.xz"
      sha256 "c480951b4ecdb85b087ef57b44bcb09ab8f32c20f0f307b36cc86cbf645f0cfe"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.18.0/rtx-brew-v1.18.0-macos-arm64.tar.xz"
      sha256 "7ef0bea1375195eaea5aaec36c3b2c0c054023e7fc4987c7675bbac721e14344"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.18.0/rtx-brew-v1.18.0-linux-arm64.tar.xz"
      sha256 "6a4c2291b1e055bec8b5b99d836875e91e87549fdac799a9a17d98bd7b1dda89"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.18.0/rtx-brew-v1.18.0-linux-x64.tar.xz"
      sha256 "eaebf1aeab806336a8ba326597be3536483a3723be1e59ecd36c1dd7e540ee12"
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
