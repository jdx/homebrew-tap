class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.23.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.1/rtx-brew-v1.23.1-macos-x64.tar.xz"
      sha256 "aad8aafd3f9972f29061173e9310e4266e4219f45d4126684d1990b508bd0060"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.23.1/rtx-brew-v1.23.1-macos-arm64.tar.xz"
      sha256 "55da7e24654c010df75036a888e1d711ca66a641df247530fe4ba4375ca48efb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.23.1/rtx-brew-v1.23.1-linux-arm64.tar.xz"
      sha256 "502da1bfde1e74657b7d39aee312cc433080124ded798123f4e1fa37b4105856"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.23.1/rtx-brew-v1.23.1-linux-x64.tar.xz"
      sha256 "b51e3eb5d935d6937ca98574a3062662aaa3d71eebbe5bbeac05127e13668139"
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
