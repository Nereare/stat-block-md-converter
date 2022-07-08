################################################
#             CUSTOMIZATION SCRIPT             #
#             ====================             #
# Welcome to the version 2.0 of this template! #
# In this version, we aim to automatize the    #
# setting up of your new repository with an    #
# automated script.                            #
# This automation requires Ruby 2.5.0 or later #
# installed and the reading and writing        #
# permissions to the repository's folder.      #
#                                              #
# Set the variables bellow to your project's   #
# data BEFORE running the script.              #
# Once the script is run, the adequate place-  #
# holders are replaced, and subsequent runs of #
# this script will result in either nothing or #
# an error.                                    #
# If you run this script by accident, pull the #
# template files from the repository (and      #
# replace any conflicting files by the source  #
# ones), then run this script once again.      #
# This script will prompt if you are sure you  #
# want to run it so you cannot blame the code. #
#                      :)                      #
################################################

################################################
#               STRING VARIABLES               #
################################################
# The full name of the project
name = "Project Name"
# The slug name for the project
# Ideally, the GitHub slug, for parity
slug = "project-name"
# Your author name (or pseudonym)
author = "Igor Padoim"
# Your GitHub username
github = "Nereare"
# Your email for contact purposes
email = "igorpadoim@gmail.com"
# Your website or GitHub profile
site = "https://nereare.com/"
# The long description of this project
# Used mainly in the README file
description = %Q{
Laboris enim tamen consequat magna. De duis incididunt excepteur o mentitum duis
voluptate. Commodo irure ipsum ad anim.Quem cupidatat eu quem irure. Quid non
commodo o culpa. Legam laborum exercitation, iis occaecat familiaritatem, de
tamen pariatur distinguantur, occaecat aliqua sed aliquip praetermissum. Quis
admodum ex singulis.
}
# The short description of this project
# Make it on-line
desc = "Ipsum elit illum cillum minim esse illum quis cillum multos"
# The copyright years of this project
# It is a string, so that a range of years can be used:
# E.g. "2019, 2021-2022" or "2004-2013"
year = "2022"
# The initial version of the project
# Do not include "v." or "v"
version = "0.1.0"

################################################
#         FILE HOLDING VERSION NUMBER          #
# This is an array of arrays and strings.      #
# Each element of the main array is a list     #
# item to be listed.                           #
# These items may be output as two things:     #
# - If the item is a String, it will be just a #
#   list item; and                             #
# - If the item is an array, this array must   #
#   contain two Strings which will output an   #
#   anchor (link), where the first string is   #
#   the link text and the second one the URI.  #
################################################
files = [
  "Any example files",
  [
    "Package JSON file",
    "package.json"
  ]
]

################################################
#                   LICENSE                    #
# Here you chose your license for the project. #
# The default is the Hippocratic License.      #
# If you want other licenses, below are some   #
# commented others.                            #
#                                              #
#                     NOTE                     #
# We >HIGHLY< disencourage the use of GNU GPL, #
# since it places economic freedom over basic  #
# Human Rights.                                #
################################################
license = [
  "Hippocratic License",
  "./Lic_HL3.md",
  "Hippocratic-3",
  "https://firstdonoharm.dev/"
]
=begin
license = [
  "GNU General Public License v3.0 or later",
  "./Lic_GPL3.md",
  "GPL-3.0-or-later",
  "https://www.gnu.org/licenses/gpl-3.0.en.html"
]
license = [
  "MIT License",
  "./Lic_MIT.md",
  "MIT",
  "https://opensource.org/licenses/MIT"
]
license = [
  "The Unlicense",
  "./Lic_UnL.md",
  "Unlicense",
  "https://unlicense.org/"
]
license = [
  "Do What The F*ck You Want To Public License",
  "./Lic_WTFPL.md",
  "WTFPL",
  "http://www.wtfpl.net/"
]
=end

################################################
#                    SCRIPT                    #
# Here the script begins.                      #
# Any change below is made at your own risk.   #
################################################

system("clear") || system("cls")

def to_the_hills(val)
  puts "(Press any key to exit)"
  gets
  exit val
end

version_files = ""
files.each do |val|
  if val.kind_of?(Array)
    version_files += "    - [" + val[0] + "](" + val[1] + ")\n"
  else
    version_files += "    - " + val + "\n"
  end
end
version_files.chomp!

description.strip!

puts "################################################"
puts "#             CUSTOMIZATION SCRIPT             #"
puts "#             ====================             #"
puts "# Welcome to the customization script for my   #"
puts "# repository template.                         #"
puts "# We will ask a few questions to confirm the   #"
puts "# data we hope with our heart of hearts you    #"
puts "# fed this script before running it.           #"
puts "# Fret not, if you haven't done so, we won't   #"
puts "# be deeply and unrevokably disappointed. :)   #"
puts "################################################"
puts ""
puts "0. FIRST"
puts "   Have you opened this script of your own voli-"
puts "   tion? (y/N)"
reply = gets.chomp.downcase
if reply == "y"
  puts "1. So, let's make some checks:"
  checks = [
    ["project's full name", name],
    ["project's slugified name (GitHub repo)", slug],
    ["name or pseudonym", author],
    ["GitHub username", github],
    ["email", email],
    ["site", site],
    ["project's full description", description],
    ["project's short (one line) description", desc],
    ["project's year of copyright", year],
    ["project's initial version", version],
    ["project files containing such version", version_files],
    ["project's license", license[0]]
  ]
  checks.each.with_index(1) do |v, i|
    puts "1.#{i}. Is this your #{v[0]}? (Y/n)"
    puts v[1]
    reply = gets.chomp.downcase
    if reply == "n"
      puts "So, please, edit the script with the correct"
      puts "value. :)"
      to_the_hills 1
    end
  end

  puts "2. Begining the customization process."
  steps = [
    ["{{PKG_NAME}}", name],
    ["{{PKG_REPO}}", slug],
    ["{{PKG_AUTHOR}}", author],
    ["{{PKG_USERNAME}}", github],
    ["{{PKG_USEREMAIL}}", email],
    ["{{PKG_USERURI}}", site],
    ["{{PKG_DESCRIPTION}}", description],
    ["{{PKG_DESC}}", desc],
    ["{{PKG_YEAR}}", year],
    ["{{PKG_VERS}}", version],
    ["{{PKG_VERS_FILES}}", version_files],
    ["{{PKG_LICENSE_NAME}}", license[0]],
    ["{{PKG_LICENSE_SPDX}}", license[2]],
    ["{{PKG_LICENSE_URI}}", license[3]]
  ]
  steps.each.with_index(1) do |v, i|
    files = Dir["./*"]
    files.each do |va|
      contents = File.read(va)
      contents.gsub!(Regexp.new(v[0]), v[1])
      File.open(va, 'w') do |file|
        file.write contents
      end
    end
    puts "  2.#{i}. Replaced all #{v[0]} instances."
  end

  puts "3. Setting license."
  license_files = Dir["./Lic_*"]
  license_files.each.with_index(1) do |file, i|
    if file != license[1]
      puts "  3.#{i}. Deleting usused #{file} file."
      File.delete(file)
    else
      puts "  3.#{i}. Setting #{file} file as LICENSE.md."
      File.rename(file, "LICENSE.md")
    end
  end

  puts "4. Do you want to delete this file? (Y/n)"
  reply = gets.chomp.downcase
  if reply != "n"
    File.delete("Customize.rb")
  end

  puts "5. Everything set up!"
  to_the_hills(0)
else
  puts "That's alright..."
  puts "Open the script without executing it, then."
  to_the_hills 1
end
