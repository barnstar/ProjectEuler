#!/usr/bin/python

import sys

#If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
#then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

#Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 
#letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out 
#numbers is in compliance with British usage.

digit_map = {0:"", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine"}
teens_map = {10:"ten", 11:"eleven", 12:"twelve", 13:"thirteen", 14:"fourteen", 15:"fifteen", 16:"sixteen", 17:"seventeen", 18:"eighteen", 19:"nineteen"}
tens_map = {2:"twenty", 3:"thirty", 4:"forty", 5:"fifty", 6:"sixty", 7:"seventy", 8:"eighty", 9:"ninety"}


def main():
    total = 0
    for num in range(1,1001):
        total += len(num_to_string(num, num>100))
    print "The number of letters is %d\n" % (total)

def num_to_string(num, include_and):
    if num<10:
        return digit_map[num]
    elif num<20:
        return teens_map[num]
    elif num<100:
        return tens_map[int(num / 10)]+num_to_string(num % 10, False)
    elif num<1000:
        and_str = 'and' if (include_and and num%100 !=0) else ''
        return digit_map[int(num/100)]+"hundred"+and_str+num_to_string(num%100, True)
    elif num<1000000:
        return digit_map[int(num/1000)]+"thousand"+num_to_string(num%1000, True)
    else:
        return "TOO BIG"



if __name__ == '__main__':
    main()