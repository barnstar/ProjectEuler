#!/usr/bin/python

import sys

description = 'Find the first triangular number with 501 divisors\n'
num_divisors_check=500

def main():
    sys.stdout.write(description)
    index = 50L
    tri_val = get_tri(index)
    num_divisors = 1
    record = 0
    
    #Primes <10000 are quickly calculated and should be sufficient
    primes = get_primes(10000, [2])

    while(1):
        index+=1L
        tri_val+=index             
        factors = factor(tri_val, primes)
        unique_factors = set(factors)

        #The number of divisors for n unique factors is 2^n...  Therefor, if we have 9 unique
        #factors, we'll have at least 512 divisors.  More if there are duplicates
        if(len(unique_factors) >= 10):
            print 'Result: %dth tri with val %d and %d divisors' % (index, tri_val, num_divisors)
            print str(factors)
            
    print 'Result: %dth tri with val %d and %d divisors' % (index, tri_val, num_divisors)


def get_tri(num):
    retVal = 0L
    for i in range(num):
        retVal+=(i+1)
    return retVal
    
def factor(val, primes):
    factors = []
    prime_index = 0
    remainder = val

    while prime_index < len(primes):
        prime = primes[prime_index]
        if remainder % prime == 0: #This is a factor
            factors.append(prime)
            remainder = remainder / prime
        else:
            prime_index += 1

        if remainder == 1:
            break

    if remainder > 1:
        factors.append(remainder)

    #factors.append(val)
    return factors

def multiple_count(val, factors):

    return     
    
def get_primes(max_val, primes):
    for val in range(3, max_val, 2):
        is_prime = True
        for prime in primes:
            if val % prime == 0:
                is_prime = False
                break
        if not is_prime:
            continue
        else:
    	    primes.append(val)
    return primes
			
	

if __name__ == '__main__':
    main()
    