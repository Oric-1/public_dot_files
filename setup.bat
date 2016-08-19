echo "This script makes a link for all the files
echo "This script should be run from the command prompt as it needs access to mklink"

mklink /H ..\_vimrc _vimrc
mklink /H ..\.gitignore_global .gitignore_global

