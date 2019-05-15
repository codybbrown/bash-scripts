# This will lower case and change whitespace to single underscore on all files
find . -type f -exec rename -nfc --nows '{}' \;
find . -type f -exec rename -fc --nows '{}' \;

# This will take the resulting _-_ and make them a single underscore
-type f -exec rename -n 's/_-_/_/g' '{}' \;
-type f -exec rename 's/_-_/_/g' '{}' \;

# testing git diff