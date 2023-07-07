class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.32.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.4/rtx-brew-v1.32.4-macos-x64.tar.xz"
      sha256 "189a4b6be90528485dacad7b44c26eff37cbfae93c819be3b54fcd4b5b3e83bd"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.32.4/rtx-brew-v1.32.4-macos-arm64.tar.xz"
      sha256 "d52acb25367664b8ba4b647fbe4f77a848369174aaf596fe518cc74454584b6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.32.4/rtx-brew-v1.32.4-linux-arm64.tar.xz"
      sha256 "927ae1e255784a814a950b38ff2d4ff8edd9c1c98ef10f593ffc3e92d47fc5a1"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.32.4/rtx-brew-v1.32.4-linux-x64.tar.xz"
      sha256 "fabfe60acfaa19b23dc0266d5c3b32a96b8714e24f1258738dd0880db65409cf"
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
