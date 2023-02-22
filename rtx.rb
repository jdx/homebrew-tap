class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.15.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.0/rtx-v1.15.0-macos-x64.tar.xz"
      sha256 "2aa41f7e7504df7b8ea91612e9b9c1e66602901160b1fd332237c6343d78638a"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.0/rtx-v1.15.0-macos-arm64.tar.xz"
      sha256 "bab7a3e330509c5c187759c2e5bc60c7085e1146af269e31534ec75e421fbbaa"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.0/rtx-v1.15.0-linux-arm64.tar.xz"
      sha256 "943cfc934a6818a8d7541007640d0aa26bfe2bd696bd83df073377f240ab7400"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.15.0/rtx-v1.15.0-linux-x64.tar.xz"
      sha256 "f6c6a0e75d05dc61091828a66771c1a7a78887541423724d5c6339105bbacf71"

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
