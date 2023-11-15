class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.11.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.4/rtx-nonup-v2023.11.4-macos-x64.tar.xz"
      sha256 "b95c64f829fed7ec7eef9e2d6d42df60cba6192bdbe8e2cd40bda18d1abe1713"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.11.4/rtx-nonup-v2023.11.4-macos-arm64.tar.xz"
      sha256 "4ef709a23b560fe442489826d8455d4a77beabe25b6aece626fcd75301e16eea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.11.4/rtx-nonup-v2023.11.4-linux-arm64.tar.xz"
      sha256 "2be9e437a8db70d8ccbbdaaab98b3bc9314c22e8c285f530ead704cb876c4e5d"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.11.4/rtx-nonup-v2023.11.4-linux-x64.tar.xz"
      sha256 "2b6b90788f327a63b8496fe54e7d6497fcaec447c0c7b8792f00c9cf55310f9c"
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
