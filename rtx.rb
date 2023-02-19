class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.10.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.1/rtx-v1.10.1-macos-x64.tar.xz"
      sha256 "602960aaaac31a9c846dd5112c67880fa81af3962bd7402b5516ec821797b4d2"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.1/rtx-v1.10.1-macos-arm64.tar.xz"
      sha256 "4abae304103bd6611702234c0f19aa7917c61a7dbcaff57bc5bfa454a168979f"

      def install
        bin.install "bin/rtx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.1/rtx-v1.10.1-linux-arm64.tar.xz"
      sha256 "59410b20438628618ae6bb63c459536e26e903338a1bb577bf2c833ec3b1fb21"

      def install
        bin.install "bin/rtx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/jdxcode/rtx/releases/download/v1.10.1/rtx-v1.10.1-linux-x64.tar.xz"
      sha256 "fb5a4c5fa8459e14244fbef7a34603e4096c10ac6a2414f7c97b9ccdd98a0c79"

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
