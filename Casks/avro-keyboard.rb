cask "avro-keyboard" do
  version "v1.2.0"
  sha256 :no_check

  url "https://github.com/rashomon-gh/iAvro-Swift/releases/download/#{version}/Avro-Keyboard-#{version}.zip"
  name "Avro Keyboard"
  desc "Bengali phonetic input method for macOS using Avro Phonetic"
  homepage "https://github.com/rashomon-gh/iAvro-Swift"

  depends_on macos: ">= :sequoia"

  input_method "Avro-Keyboard-Release/Avro Keyboard.app"

  postflight do
    # Automatically strip the quarantine attribute so macOS doesn't block the unsigned input method
    system_command "xattr",
                   args: ["-cr", "#{ENV["HOME"]}/Library/Input Methods/Avro Keyboard.app"]
  end

  caveats do
    <<~EOS
      After installing, add Avro Keyboard from:
        System Settings → Keyboard → Input Sources → Edit → +

      Security Note: Avro Keyboard is not signed with an Apple Developer certificate.
      To prevent Gatekeeper from blocking it, this cask automatically removes the
      quarantine attribute using 'xattr -cr' during installation.
    EOS
  end

  uninstall delete: "~/Library/Input Methods/Avro Keyboard.app"

  zap delete: [
    "~/Library/Application Support/OmicronLab",
  ]
end
