cask "wardrobe" do
  version "0.0.4b"
  sha256 :no_check 

  url "https://github.com/rashomon-gh/Wardrobe/releases/download/#{version}/Wardrobe.zip"
  name "Wardrobe"
  desc "Privacy-first, local macOS semantic screenshot organizer"
  homepage "https://github.com/rashomon-gh/Wardrobe"

  app "Wardrobe.app"

  # Remove the quarantine attribute from the app to bypass Gatekeeper's 
  # "App is damaged and can't be opened" error for ad-hoc signed apps.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Wardrobe.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Scripts/org.shawonashraf.Wardrobe",
    "~/Library/Containers/org.shawonashraf.Wardrobe",
    "~/Documents/Wardrobe"
  ]
end

