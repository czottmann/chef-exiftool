include_recipe "apt"
include_recipe "build-essential"


%w( wget ).each do |pkg|
  package pkg do
    action :install
  end
end

execute "get, unpack, configure & make exiftool #{ node[:exiftool][:version] }" do
  filename = "Image-ExifTool-#{ node[:exiftool][:version] }"
  cmmnd = [
    "cd /usr/src",
    "wget http://www.sno.phy.queensu.ca/~phil/exiftool/#{filename}.tar.gz",
    "tar -xf #{filename}.tar.gz",
    "cd #{filename}",
    "perl Makefile.PL",
    "make test",
    "make install"
  ].join(" && ")

  user "root"
  command cmmnd
  not_if "exiftool -ver | grep #{ node[:exiftool][:version] }"
end
