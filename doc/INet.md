```$xslt
@param __cp 表示字符串Ip地址 “127.0.0.1”
@param __buf 存储转化后的Ip信息
该方法是将IP地址转换成uint32位，并且按照网络字节序，存储到__buf
extern int inet_pton (int __af, const char *__restrict __cp,
		      void *__restrict __buf) __THROW;

@param  __in ip地址
将网络字节序 uint32转换成为 string 形式的Ip
extern char *inet_ntoa (struct in_addr __in) __THROW;
```