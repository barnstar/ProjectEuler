#!/usr/bin/python

'''
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
'''

# Observe the pattern where the 4 diagonals are the previous diagonal + (shell_index -1)
# We can quickly calculate a list of the diagonals and add them together
# Of course, we don't need the actual list of diagonals, we could keep a running sum 

spiral_size = 1001

def main():
    diagonal_sum = sum(spiral_diagonals(spiral_size))
    print "The sum of the diagonals for a 1001 spiral is %d" % (diagonal_sum)

def spiral_diagonals(size):
    #Real code should check if size is odd and > 1
    diagonals = [1]
    index = 3
    while index <= size:
        for i in range(0,4):
            diagonals.append(diagonals[len(diagonals) - 1] + index -1)
        index = index + 2
    return diagonals 


if __name__ == '__main__':
    main()