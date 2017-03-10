#!/usr/bin/python
'''
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
'''

def main():
    matches = []
    #7 * 9^5 is < 6 digits so we only need to search up to 1 million.. Probably less.. but meh
    for i in range(10,1000000):
        if sum_fifth_powers(i) == i:
            print "Found one!  %d" % (i)
            matches.append(i)
    print "Sum of matches is %d" % (sum(matches))
        
            
def sum_fifth_powers(num):
    sum = 0
    for digit in str(num):
        sum = sum + int(digit)**5
    return sum

if __name__ == '__main__':
    main()