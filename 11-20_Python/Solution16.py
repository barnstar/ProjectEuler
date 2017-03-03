#!/usr/bin/python


import sys

#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#What is the sum of the digits of the number 2^1000?

#Well, this is python, so we can actually calculate 2^1000 using the internal integer
#type.  Yeah, that's cheating, but why re-invent the wheel...

max_exp = 1000

def main():
    result = 0
    for c in str(pow(2,max_exp)): result += int(c)
    print "The sum of the digits in 2^1000 is %d" % (result)

if __name__ == '__main__':
    main()