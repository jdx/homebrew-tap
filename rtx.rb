class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.11.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.1/rtx-v1.11.1-macos-x64.tar.xz"
      sha256 "7e637bbfe6d6cb978d27338a17e04dc33075722e72ce37427e836cec1a46b9cc"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.1/rtx-v1.11.1-macos-arm64.tar.xz"
      sha256 "8398351bf43dbadcd5fef149c347c79f3e5de017b3f694fb7673383627632b4f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.1/rtx-v1.11.1-linux-arm64.tar.xz"
      sha256 "3e439437b8b44b97e6eab60ea342cdf2e3c8770b678ad7faec7ad78c5438c97d"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.11.1/rtx-v1.11.1-linux-x64.tar.xz"
      sha256 "88828052692017af18be3c56117815cf2e78cf7876af82755b56d1af07092c19"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  test do
    system "#{bin}/rtx --version"
    assert_match "it works!", shell_output("#{bin}/rtx exec nodejs@18 -- node -p 'it works!'")
  end
end
