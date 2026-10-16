class jumpshell < Formula
  desc "JumpShell is a cross-platform .NET 10 console app for managing and opening saved remote connections. "
  homepage "https://github.com/ollie-galbraith/jumpshell"
  version "1.2.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ollie-galbraith/jumpshell/releases/download/v#{version}/jumpshell-osx-arm64"
      sha256 "c8e751b054333c14692372d9ed52a8e8a47de5d086eb73231c775a2148fcac46"
    else
      url "https://github.com/ollie-galbraith/jumpshell/releases/download/v#{version}/jumpshell-osx-x64"
      sha256 "d5e7a185d16a04e525dba01efba15d9db65911bb48b9685b762aa363067f4425"
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