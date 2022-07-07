#lsof -p 61372 - дескриптори для процесу 61372
# lsof -u yaroslav - всі дескриптори для користувача

#  cwd  current working directory;
#  Lnn  library references (AIX);
#  err  FD information error (see NAME column);
#  jld  jail directory (FreeBSD);
#  ltx  shared library text (code and data);
#  Mxx  hex memory-mapped type number xx.
#  m86  DOS Merge mapped file;
#  mem  memory-mapped file;
#  mmap memory-mapped device;
#  pd   parent directory;
#  rtd  root directory;
#  tr   kernel trace file (OpenBSD);
#  txt  program text (code and data);
#  v86  VP/ix mapped file;


#If we use tr command along with squeeze option (-s flag ) to convert all multiple consecutive spaces to a single space and then perform cut operation with space as delimiter – we can access the required column carrying the numbers:
# tr -s ' ' | cut -d ' ' -f 8
#https://unix.stackexchange.com/questions/109835/how-do-i-use-cut-to-separate-by-multiple-whitespace

lsof -u yaroslav | tr -s ' ' | cut -d ' ' -f 2,4,9 > desc.txt
