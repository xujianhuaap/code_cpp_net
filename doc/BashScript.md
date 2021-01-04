### BashScript

#### <ol>getOpts

```$xslt

    
getOpts optstring name [arg]

该命令用于解析位置参数作为选项；例如./xxx.sh -d xujianhua -c /usr/local/lib；
该命令一般解析位置参数（$0-$9）,但是如果给更多的参数也可以解析以替代位置参数；

optstring (:d:c:)包含着若干选项(d和c),若是以冒号开头表示error silent (有错误也不打印错误信息)，
若选项后面有冒号表示该选项(d)有参数arg(xujianhua)

当命令被调用的时候，给命令会将选项（ｄ)赋值给变量name;若name不存在会初始化一个；
同时参数arg的位置会赋值给变量OPTIND;在命令调用的时候OPTIND一般会初始化为１;
若该选项（ｄ）需要参数arg,则赋值给变量OPTARG;


该命令有两种报错方式：
１＞Silent Mode 在optstring 以冒号开头，使用silent模式；
如果该命令发现一个无效的选项例如cc,会给变量name赋值为?并且把该选项字母赋值给变量OPTARG;
如果一个选项需要参数却未带参数，那么会给变量name赋值为冒号(:)并且赋值选项字母给变量OPTARG;
    
2> UnSilentMode 如果是无效选项，则变量NAME赋值为? OPTARG不设值；如果选项需要参数却没有
参数，赋值?给变量name 并且变量OPTARG不设值；打印错位信息

变量OPTERR默认值是１；在设置为０的情况下　无论处于什么模式都不会打印错误信息；


如果选项被发现返回success 如果发生错误挥着或者是最后一个选项的结束标志返回failure


```

#### <li> test
```$xslt
test - check file types and compare values

该命令用于检查文件的类型和比较值



test expresson1 -a expresson2  //expresson1 expresson2都返回true　才是true
test expresson1 -o expresson2 //expresson1 expresson2 至少一个为true 便是true

test num1 -eq num2
test num1 -ne num2
test num1 -gt num2 //num1>num2
test num1 -lt num2 //num1<num2
test num1 -ge num2 //num1>=num2
test num1 -le num2 //num1<=num2

test -n STRING //字符串的长度不为零
test -z STRING //字符串长度为零

test strint1 = string2
test string1 != string2

test file1 -nt file2 //修改日期file1早于file2
test file1 -ol file2 // 修改日期file1晚于file2
test file1 -ef file2 //两个文件是否是相同的设备号和索引节点号

test -d dir 
test -f file
test -e dir_or_file
test -r file
test -w file
test -b file //文件存在　特殊块文件
test -c file //文件存在　特殊字符
test -h file //链接符号的文件
test -L file //上同test -h file
test -S file//socket的文件
test -g file //设置组id的文件
test -G file //被有效的组id包含的文件
test -O file //被有效的用户id包含的文件
test -p file//命名的管道文件
test -s file //文件大小大于０的文件

test -t FD //用于打开Terminal的文件描述符号


```  

#### <li> grep

```$xslt
grep [options]... PATTERN [FILE]....

example:

Pattern selection and interpretation:
  -E, --extended-regexp     PATTERN is an extended regular expression
  -F, --fixed-strings       PATTERN is a set of newline-separated strings
  -G, --basic-regexp        PATTERN is a basic regular expression (default)
  -P, --perl-regexp         PATTERN is a Perl regular expression
  -e, --regexp=PATTERN      use PATTERN for matching
  -f, --file=FILE           obtain PATTERN from FILE
  -i, --ignore-case         ignore case distinctions
  -w, --word-regexp         force PATTERN to match only whole words
  -x, --line-regexp         force PATTERN to match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline

Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit

Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
  -o, --only-matching       show only the part of a line matching PATTERN
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
  -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
      --include=FILE_PATTERN  search only files that match FILE_PATTERN
      --exclude=FILE_PATTERN  skip files and directories matching FILE_PATTERN
      --exclude-from=FILE   skip files matching any file pattern from FILE
      --exclude-dir=PATTERN  directories that match PATTERN will be skipped.
  -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name

Context control:
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
  -C, --context=NUM         print NUM lines of output context
  -NUM                      same as --context=NUM
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)

When FILE is '-', read standard input.  With no FILE, read '.' if
recursive, '-' otherwise.  With fewer than two FILEs, assume -h.
Exit status is 0 if any line is selected, 1 otherwise;
if any error occurs and -q is not given, the exit status is 2.

Report bugs to: bug-grep@gnu.org
GNU grep home page: <http://www.gnu.org/software/grep/>
General help using GNU software: <http://www.gnu.org/gethelp/>

```
   
  
