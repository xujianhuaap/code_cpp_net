### 开发摘要
#### 20201205 
- void * 指针，是说任何其他数据类型的指针变量都可以赋值给指针；但是该指针变量，必须转化后才能给予其他类型的指针变量；
restrict 是C语言中的类型限制符号，告诉编译器对象已经被指针引用，不能使用该指针之外的其他方式改变该对象的值；

```$xslt
extern int inet_pton (int __af, const char *__restrict __cp,
		      void *__restrict __buf) __THROW;
```
- IP地址转化
1. string format -> uint32

```$xslt
IP               网络字节字序      主机字节字序
127.0.0.1         16777343      2130706433
```