#!/usr/bin/python


description = 'Find the first 10 digits of the sum of all the 100 50 digit numbers\n'

import sys

def main():
    file = open("Solution13.dat",'r')
    
    values = []
    file.seek(0)
    for line in file:
        values.append(line)

	#String to hold the extra large result    
    result = ''
    carry = 0L
    
    for index in range(49,-1,-1): 
        sum = carry
        for num in values:
            last_digit = num[index]
            sum += int(last_digit)
        digit = sum % 10
        carry = (sum - digit) / 10
        result += str(digit)
        print "Digit:%d  Carry:%d  Sum:%d" % (digit, carry, sum)

	##Reverse the result and add the carry digits
    result = result[::-1]
    full_result = str(carry) + result
    print "Sum: " + full_result
    print "First 10 Digits: " + full_result[0:10]


if __name__ == '__main__':
    main()