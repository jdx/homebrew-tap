class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.26.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.1/rtx-brew-v1.26.1-macos-x64.tar.xz"
      sha256 "d86fbbccf8021b94863059a844e8b3f9909d9586a5b10632cfbafc203aeebced"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.26.1/rtx-brew-v1.26.1-macos-arm64.tar.xz"
      sha256 "b8a1f1d75895df9115aae249d13f36b46df9662b72b767113f280f387a0460b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.26.1/rtx-brew-v1.26.1-linux-arm64.tar.xz"
      sha256 "2b8fa7e74c7a7e2a59ee93322c0546fce293ddca68786d1f7ef0c2ec0b787bf4"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.26.1/rtx-brew-v1.26.1-linux-x64.tar.xz"
      sha256 "f432075676c12561166414291ca7e481968d034103dea9d87166f3b32f805971"
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
