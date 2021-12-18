# Shell Scripting

1. Read man ls and write an ls command that lists files in the following manner
	_Includes all files, including hidden files
	Sizes are listed in human readable format (e.g. 454M instead of 454279954)
	Files are ordered by recency
	Output is colorized_

```sh
 ls -laht --color
```

2.Write bash functions marco and polo that do the following. 
Whenever you execute marco the current working directory should be saved in some manner, 
then when you execute polo, no matter what directory you are in, 
polo should cd you back to the directory where you executed marco. 
For ease of debugging you can write the code in a file marco.sh and
(re)load the definitions to your shell by executing source marco.sh.

```sh
marco(){
	mypath=$(pwd)
}
```

```sh
polo(){
	cd $mypath
}

