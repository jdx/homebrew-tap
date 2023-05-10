class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.29.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.7/rtx-brew-v1.29.7-macos-x64.tar.xz"
      sha256 "785b5867708adeaa254a5c42f5767b8be43113965d16978f890f40b784506a7e"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.29.7/rtx-brew-v1.29.7-macos-arm64.tar.xz"
      sha256 "d8e075f68a234b80f3c53a407d22dff4f71b46cdce5c5e48b30dce663946575a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.29.7/rtx-brew-v1.29.7-linux-arm64.tar.xz"
      sha256 "ef040c749a25bb037fab23c5047e37a9d55516e3f5af90505088590c95c840e0"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.29.7/rtx-brew-v1.29.7-linux-x64.tar.xz"
      sha256 "287c9dc2dcc1f9ab561c7674dab1c1b72213ec76074f5e99d7e73f87e24c4f98"
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
