### BashScript

#### <ol> special char
```
1. '.'代表是任意单个字符；　
    '*'代表是通配符号，echo * 表示打印当前目录下所有的文件
    '?' 用于三元运算符号；　：　${username?} 这里的问号（username与？之间不能有空格）用于判断变量是否赋值，若没赋值则打印错误
2. ‘，’可以用来连接字符串　example: if file in ${,/usr}/bin 表示/bin 或者/usr/bin 目录下
3. '`' 命令替换符号　`command`可以将命令结果赋值给变量
4. ':' 可以表示空命令　该命令默认返回为true  example
            while : 
            do
            ...
            done
        这里while : 等同于　while true;
        if condition ; then :
        else
        ....
        fi
        这里的then : 相当于占位符不做任何操作
        ： ${username=`whoami`}
        这里的：只是占位，不然会报错
        ：　> test.txt 清空test.txt文件，若该文件不存在则创建
        ：　>> test.txt 不会清空文件若文件不存在则创建
        PATH=/usr/bin:$PATH 这里：作为域的分割符号
5. '$$' 表示脚本运行进程Id
    $* $@ 表示位置参数，在没有双引号的时候二者一样，但被双引号包括的时候二者有区别
        ./test.sh a b c
        test.sh 脚本如下
        for var in "$*"
            echo $var //打印的内容为　a b c
        for var in "$@"
            echo $var 
        //打印内容为　ａ
                    b
                    c
        可见在$* 是把所有的输入参数作为一个整体　$@是把输入的参数依次取出
    　$? 该变量保存一个命令，脚本，函数执行完毕的状态
6. () 命令组　会开启一个子shell,在子shell中的变量当前shell无法访问
   例如　a=3
        (a=2;)
        echo $a //仍然是３
   ()可以用于初始化数组
    arr=(1,2,3)
7.{xxx,yyy} 用于扩展文件结构
    echo *.{txt,sh,doc}
 {n..m}//表示n-m之间的所有数字或者字母，包括ｎ和m
 {} 代码块，实质是一个匿名函数
    a=3
    {a=4}
    echo $a //打印出４
 {}也可以作为占位符号，在xargs -i 后面作为占位符号使用


8.　[] 是test的组成部分，[]之间是test的表达式
    if test -f file 等同于　if　[ -f file]
    [a-z]表示a-z范围内的任意字符
    $[] 整数扩展符号
        a=3
        b=4
        $[$a+$b]//7
9. scriptName > fileName 将脚本重定向输出到文件fileName 并且覆盖以前内容，文件不存在将创建新的文件
  　scriptName >> fileName 将脚本追加到文件fileName 文件不存在创建新的文件
    command &> fileName 将命令返回内容输出到文件fileName 并且覆盖以前内容，文件不存在将创建新的文件
    command &>> fileName
    command >&2 将命令输出到错误输出

10. << 表示here-document

11. command & 表示该命令转至后台进行
12. - 表示短选项　netstat -ant
    cat - 这里表示从标准输入读取内容
    cd - 表示回到以前的工作目录
13. ~+当前工作目录
    ~-上一个工作目录

```
#### <li>getOpts

```
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
grep -o xujianhua ./test.txt

-o 只展示选中的内容
-v 展示反向选择的内容
-i 忽略大小写
-w 所在行某个Word匹配PATTERN
-x 所在行完全匹配PATTERN
-f fileName PATTERN来源某个文件fileName
-n 打印行数
-c 打印每个文件匹配到的行数
-s 忽略错误信息
-m 匹配到的行数的最大值
-H 打印文件名称
-l 打印匹配到文件名称
-L 打印未匹配到文件名称
-r 递归遍历目录
-R 同样是递归遍历但是也遍历符号链接

--include=FILE_PATTERN 增加匹配条件FILE_PATTERN 
--exclude=FILE_PATTERN  选中的要排除FILE_PATTERN
--exclude-from=FILE   选中的要排除FILE这个文件
--exclude-dir=PATTERN  选中的要排除匹配PATTERN的这些目录

当FILE是 ‘-’表示是标准输入；没有设置FILE的时候，从当前路径读；
如果有匹配到的返回0，没有匹配到返回1；在发生错误的时候 -q没有设置的情况下，返回状态码2；

```

#### <li> tr
```
tr [options] set1 [set2]
将标准输入翻译后再标准输出
example:
echo "xujianhua"| tr a-z A-Z //将小写转化成大写


```

####  <li> echo and printf
```
echo 打印表达式或者命令到标准输出
    -n 不输出换行
    -e 支持反斜杠 echo -e 'xu \n'
    -E 不反斜杠
echo command // echo 会删除command中的换行

printf
    printf("%s ,hello","xu")
```
#### <li> read
```
read 从标准输入或者键盘读取变量
-d //结束字符 example: read -d e 表示遇到字母e就结束
-p //提示语  example read -p "your name:" user_name
-n //长度限制
-N //长度限制忽略 -d选项的作用
-s //不打印输入内容
-t //超时限制以秒为单位
-u fd//从文件中读取
```
   
  
