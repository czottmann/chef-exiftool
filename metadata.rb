maintainer        "Carlo Zottmann"
maintainer_email  "carlo@zottmann.org"
license           "WTFPL"
description       "Installs exiftool 8.60 from source"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.mdown'))
version           "1.0"
supports          ubuntu

%w( apt build-essential ).each do |d|
  depends d
end

recipe            "exiftool", "Installs exiftool from source."
