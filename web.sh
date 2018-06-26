#!/bin/sh
function usage() {     #<==帮助函数
    echo $"usage:$0 url"
    exit 1
}
function check_url() { #<==检测URL函数。
    wget --spider -q -o /dev/null --tries=1 -T 5 $1
#<==采用wget返回值方法，这里的$1就是函数传参。
    #curl -s -o /dev/null $1 #<==采用curl返回值方法也是可以的。
    if [ $? -eq 0 ]
    then
        echo "$1 is yes."
        exit 0
    else
        echo "$1 is fail."
        exit 1
    fi
}
function main() {   #<==主函数。
     if [ $# -ne 1 ]   #<==如果传入的多个参数，则打印帮助函数，提示用户。
     then
         usage
     fi
     check_url $1     #<==接收函数的传参，即把结尾的$*传到这里。
}
main $*            #<==这里的$*就是把命令行接收的所有参数作为函数参数传给函数内部，常用手法。
