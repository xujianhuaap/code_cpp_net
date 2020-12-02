### inet.h Api Desc
#### 涉及相关对象
```$xslt
typedef uint32_t in_addr_t;
```
#### 
```$xslt
@param __cp 是char pointer 的缩写，这里表示类似于127.0.0.1类型的网络地址字符串
extern in_addr_t inet_addr (const char *__cp) __THROW;

```