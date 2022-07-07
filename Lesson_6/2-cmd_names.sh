file=usr_executables.txt

wc -l $file | cut -d ' ' -f1

head -10 $file | cut -d '/' -f4 > cmd_names