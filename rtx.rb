class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.25.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.5/rtx-brew-v1.25.5-macos-x64.tar.xz"
      sha256 "b2804ff67c9faf99dbe2cbdb83476673cfd674e8aa353f9fbbcb8e23150892c7"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.25.5/rtx-brew-v1.25.5-macos-arm64.tar.xz"
      sha256 "189824529a514d481cf5cbb2522fccad2663e7ceca153519a2c05724bc16a573"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.25.5/rtx-brew-v1.25.5-linux-arm64.tar.xz"
      sha256 "c93c4ad981ea0c2acb8b6b1be47b912965017a10bde3afd3ba4d94311b4dde4a"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.25.5/rtx-brew-v1.25.5-linux-x64.tar.xz"
      sha256 "52d150f330e3bbcdc2856c61992b86974c87371a1f61028c127ae92e8857fd36"
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
