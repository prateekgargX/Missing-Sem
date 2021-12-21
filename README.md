>Additional files includes create-html.sh which store a function taking an integer argument to recursively 
generate folders foo and bar with a html file.  
To load function into the memory, use:

```bash
source ./create-html.sh
```

# [Shell Scripting](https://missing.csail.mit.edu/2020/shell-tools/ "missing-semester")

1. Read man ls and write an ls command that lists files in the following manner

>Includes all files, including hidden files  
Sizes are listed in human readable format (e.g. 454M instead of 454279954)  
Files are ordered by recency  
Output is colorized  

```bash
$ ls -laht --color
```

2.Write bash functions marco and polo that do the following. 
Whenever you execute marco the current working directory should be saved in some manner, 
then when you execute polo, no matter what directory you are in, 
polo should cd you back to the directory where you executed marco. 
For ease of debugging you can write the code in a file marco.sh and
(re)load the definitions to your shell by executing source marco.sh.

```bash
marco(){
	mypath=$(pwd)
}
polo(){
	cd $mypath
}
```

To load:
```bash
$ source marcopolo.sh 
```

3. Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

```bash
#!/usr/bin/env bash

 n=$(( RANDOM % 100 ))

 if [[ n -eq 42 ]]; then
    echo "Something went wrong"
    >&2 echo "The error was using magic numbers"
    exit 1
 fi

 echo "Everything went according to plan"
```
Solution:

```bash
#!/usr/bin/env bash

i=1
./$1 >out.log 2>err.log

while [[ $? -ne 1 ]];
do
	((i++))
	./$1 >>out.log 2>>err.log
done

cat out.log
cat err.log

rm out.*
rm err.*

echo "number of runs : $i"
```

To run

```bash
$ ./test.sh script-to-tested.sh
```
4.Your task is to write a command that recursively finds all HTML files in the folder and makes a zip with them. Note that your command should work even if the files have spaces (hint: check -d flag for xargs).

```bash
$ find . -name "*.html" | xargs -d '\n' tar -czvf archive-name.tar.gz      
```
To extract the archive
```bash
$ tar -xzvf archive-name.tar.gz
```
