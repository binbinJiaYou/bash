#!/bin/bash
:<<!
PCRE(Perl Compatible Regular Expressions), Perl正则表达式
1. ^ 表示匹配开头
2. $ 表示匹配结尾
3. '(', ')', '{', '}', '.', '*', '+', '?', '|' 元字符不需要转义就能表示特殊含义
4. POSIX 字符集 [:digit:], [:lower:], [:upper:] 表示数字, 小写字母, 大写字母
**PS: POSIX 字符集需要搭配 POSIX 方括号表达式使用
5. POSIX 方括号表达式 [0-9], [a-z], [A-Z] 表示数字, 小写字母, 大写字母
6. PCRE 可以使用 \d, \w 等等形式表示特殊含义
POSIX 全称: Portable Operating System Interface for uniX, 它由一系列规范构成, 定义了 UNIX 操作系统应当支持的功能
!

:<<!
示例1: 匹配11位电话号码
grep, sed 命令默认使用 BRE 正则表达式
输出:
binbin: 15008570099
dongdong: 15108511234
!
cat <<EOF | grep -P '[1-9][[:digit:]]{10}'
# cat <<EOF | grep -P '[1-9]\d{10}'
binbin: 15008570099
dongdong: 15108511234
boss: 0123456789
other: 01234567890
EOF

:<<!
示例2: 匹配所有不是数字开头的行
输出:
hello world
best greet to you
!
cat <<EOF | grep -P '^[^[:digit:]]'
# cat <<EOF | grep -P '^\D'
hello world
0hello world
1heelo world
best greet to you
0best greet to you
1best greet to you
EOF