#!/bin/sh

assert_equal () {
	test "$1" = "$2" || printf "F: \"%s\" != \"%s\"\n" $1 $2
}

assert_equal "foofoo" `printf foo | ./map f 'printf $f$f'`
assert_equal "foobarbaz" `cat ./test/input | ./map f 'printf "$f"'`
