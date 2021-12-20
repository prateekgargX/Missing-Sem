create-html(){
if [[ $1 -eq 0 ]]; then
else
	mkdir foo
	cd foo
	echo  "wssup" >>my$1.html
	create-html $(($1-1))
	cd ..
	mkdir bar
	cd bar
	echo "supws" >>your$1.html
	create-html $(($1-1))
	cd ..
fi
}
