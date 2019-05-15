# ==================== FUNCTIONS ==================== 
#2) find by -iname via arg $1 -- good to pipe into other commands
finame() { 
    find "$1" -iname "$2"
}
# Find by -type via arg $1
fitype() { 
	find "$1" -type "$2" 
}
# recursively finds subdirectoires excluding current dir
fisubdir() {
	find . ! -path . -type d
}
# takes piped find directory type results and copies file $1 to all of them
cptop() {
	# "$@"
	if [[ $# -ne 1 ]]; 
	then
		xargs -n 1 cp "$1" "$2"
	else 
		xargs -n 1 cp "$1"
	fi
}
# recursively finds anything from current dir down and deletes it
fi_delete() {
	find "$1" "$2" "$3" -delete 
}

# mostly same as above but uses xargs and only good for files
# finame_rm() {
# 	find . -iname "$1" | xargs -n 1 rm
# }
vocab() {
	echo "$1" >> vocab.txt 
}

# create directory manifest
drman() {
	if [[ -e dir_manifest.txt ]]; 
	then
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
		echo "$(date)" >> dir_manifest.txt 
		echo "Directory manifest for: $(pwd)" >> dir_manifest.txt
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
		find . -type d >> dir_manifest.txt
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
	else
		touch dir_manifest.txt
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
		echo "$(date)" >> dir_manifest.txt 
		echo "Directory manifest for: $(pwd)" >> dir_manifest.txt
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
		find . -type d >> dir_manifest.txt
		echo "++++++++++++++++++++++++++++++++++++++++++++++++++++" >> dir_manifest.txt
	fi
}
# create file manifest
fman() {
	touch file_manifest.txt
	echo "$(date)" >> file_manifest.txt 
	echo "$(pwd)" >> file_manifest.txt
	find . -type f >> file_manifest.txt
}
fdman() {
	ls -Rlah >> complete_manifest.txt
}

# diskutil unmounDisk
undisk() {
	diskutil unmountDisk "$1"
}

# takes mouse defined screen cap puts in current dir
capture() {
	DATE=`date +%Y-%m-%d_%H.%M.%S`
	if [ "$1" == "date" ];
	then
		screencapture -s "$DATE".png
	else
		screencapture -s "$1".png
	fi
}
# takes mouse defined screen cap w/ name arg.  if 'date', filename will be date  
scap() {
	DATE=`date +%Y-%m-%d_%H.%M.%S`
	if [ "$1" == "date" ];
	then
		cd ~/Pictures/Screenshots/; screencapture -s "$DATE".png
	else
		cd ~/Pictures/Screenshots/; screencapture -s "$1".png
	fi
}

lovetodata() {
	cp -R "$1" /Volumes/data_emporer/from_love_thief/
}			