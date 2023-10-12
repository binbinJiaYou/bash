#!/bin/bash
:<<!
ERE(Extend Regular Expressions), 基础正则表达式
1. ^ 表示匹配开头
2. $ 表示匹配结尾
3. '(', ')', '{', '}', '.', '*', '+', '?', '|' 元字符不需要转义就能表示特殊含义
4. POSIX 字符集 [:digit:], [:lower:], [:upper:] 表示数字, 小写字母, 大写字母
**PS: POSIX 字符集需要搭配 POSIX 方括号表达式使用
5. POSIX 方括号表达式 [0-9], [a-z], [A-Z] 表示数字, 小写字母, 大写字母
**PS: BRE 和 ERE 不能使用 \d, \w 等等形式表示特殊含义, \d, \w 这种表示方法只能在 PCRE(Perl Compatible Regular Expressions)中使用
POSIX 全称: Portable Operating System Interface for uniX, 它由一系列规范构成, 定义了 UNIX 操作系统应当支持的功能
!

:<<!
示例1: 匹配11位电话号码
grep, sed 命令默认使用 BRE 正则表达式
输出:
binbin: 15008570099
dongdong: 15108511234
!
cat <<EOF | grep -E '[1-9][0-9]{10}'
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
cat <<EOF | grep -E '^[^0-9]'
hello world
0hello world
1heelo world
best greet to you
0best greet to you
1best greet to you
EOF