```$xslt
arpa/inet.h

@param __cp 表示字符串Ip地址 “127.0.0.1”
@param __buf 存储转化后的Ip信息
该方法是将IP地址转换成uint32位，并且按照网络字节序，存储到__buf
extern int inet_pton (int __af, const char *__restrict __cp,
		      void *__restrict __buf) __THROW;

@param  __in ip地址
将网络字节序 uint32转换成为 string 形式的Ip
extern char *inet_ntoa (struct in_addr __in) __THROW;
```

```
netinet/in.h

//ip uint32 网络字节序 转化成为 主机字节序
extern uint32_t ntohl (uint32_t __netlong)
 __THROW __attribute__ ((__const__));
// port unint16 网络字节序转化成为 主机字节序
extern uint16_t ntohs (uint16_t __netshort)
     __THROW __attribute__ ((__const__));
// ip uint32 主机字节序转化称为 网络字节序
extern uint32_t htonl (uint32_t __hostlong)
     __THROW __attribute__ ((__const__));
// port uint32 主机字节序转化成为网络字节序
extern uint16_t htons (uint16_t __hostshort)
     __THROW __attribute__ ((__const__));
```