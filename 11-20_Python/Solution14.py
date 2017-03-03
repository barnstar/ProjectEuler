#!/usr/bin/python

import sys

# We can cache the values of previously found sequences to speed up finding the sequence
# length for larger integers.  For 1000000 this results in a speed up of about 10x

observed_sequences = {1:0}
max_val = 1000000

def main():
    print "Longest collatz sequence under 1 million"
    max_iterations = [0,0]

    for val in range(2, max_val):
        iterations = collatz_seq_len(val, 0)
        observed_sequences[val] = iterations
        if iterations > max_iterations[0]:
            max_iterations[0] = iterations
            max_iterations[1] = val

    print "Result: %d with %d iterations\n" % (max_iterations[1], max_iterations[0])


def collatz_seq_len(val, iterations):
    if observed_sequences.get(val) != None:
        return iterations + observed_sequences[val]

    #Bitwise & should be the quickest way to determine if a number is even
    #but this is python...
    if val & 1 == 0:
       val = val/2
    else:
       val = 3*val + 1

    iterations += 1
    #Recursion is fun.  A while loop is a better idea in production code
    return collatz_seq_len(val, iterations)

if __name__ == '__main__':
    main()