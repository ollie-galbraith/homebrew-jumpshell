class Jumpshell < Formula
  desc "JumpShell is a cross-platform .NET 10 console app for managing and opening saved remote connections."
  homepage "https://github.com/ollie-galbraith/jumpshell"
  version "1.2.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ollie-galbraith/jumpshell/releases/download/v#{version}/jumpshell-osx-arm64"
      sha256 "298102e2d5b667c0c063d090945f379934bc2fa0a6a0d7ea3541380afd4f2ad4"
    else
      url "https://github.com/ollie-galbraith/jumpshell/releases/download/v#{version}/jumpshell-osx-x64"
      sha256 "da1bc308c866a44ce6f6c4cab180e55a39ee2df9ebf9ace4fedc2142c043e10b"
    end
  end

  def install
    # Rename the binary to your desired CLI command name and make executable
    bin.install "jumpshell-osx-#{Hardware::CPU.arm? ? 'arm64' : 'x64'}" => "jumpshell"
  end

  test do
    system "#{bin}/jumpshell", "--version"
  end
end