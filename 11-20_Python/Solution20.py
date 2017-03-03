#!/usr/bin/python

import sys

# Find the sum of the digits in the number 100!
# Python cheating again... We should be able to calculate 100! using built in types

def main():
    sum = 0
    for digit in str(factorial(100)) : sum += int(digit)
    print "The sum of the digits of 100! is %d" % (sum)

def factorial(val):
    retVal = 1
    for n in range(1,val+1): retVal *= n
    return retVal


if __name__ == '__main__':
    main()