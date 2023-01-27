class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "0.0.0-alpha.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.4/rtx-v0.0.0-alpha.4-macos-x64.tar.xz"
      sha256 "08247ad23a69b08e9297a7c9433105a8a45de335d58ee751451688cf83d02784"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.4/rtx-v0.0.0-alpha.4-macos-arm64.tar.xz"
      sha256 "5dfdfc34052104dac6fe8e62b491143023099208e2eee515e34e8eb0a7ed6b9b"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.4/rtx-v0.0.0-alpha.4-linux-arm64.tar.xz"
      sha256 "1509f838906d0d6dac1afa158f6b6594bf267dce155f118be319977d4742a1a2"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v0.0.0-alpha.4/rtx-v0.0.0-alpha.4-linux-x64.tar.xz"
      sha256 "11cb66bce7e2f286cc97ab3e5f0ce124ad910004b0573e488706619d7f0d0312"

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
