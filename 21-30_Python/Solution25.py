#!/usr/bin/python

import sys

'''
What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
'''

# We'll cheat and brute force this. 

def main():
    fib = (0,1,1)  # (previous, current, index)
    while len(str(fib[1])) < 1000:
        fib = (fib[1], fib[1] + fib[0], fib[2]+1)
    print "The first 1000 digit fib is at index %d" % (fib[2])

if __name__ == '__main__':
    main()

