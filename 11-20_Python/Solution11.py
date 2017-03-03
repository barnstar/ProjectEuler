#!/usr/bin/python

import sys

# Find the largest product of 4 adjacent numbers

def main():
    print 'Find the product of 4 adjacent numbers in a grid'
    values = read_matrix()

    largest_product = 0
    location = [0,0]

    for x in range(0, len(values[0])):
        for y in range(0,len(values)):
            result = find_largest_product(x,y,values)
            if result > largest_product:
                largest_product = result
                location = [x,y]

    print 'Largest product is at ' + str(location) + ' with value %d\n' % (largest_product)   


def find_largest_product(x,y,values):
    #We need to check only 4 possibilities
    # ----, | , \     ,   /
    #       |    \       /
    #       |     \     /
    #       |      \   /

    products = [0]
    #Accross and across + up
    if x+4 < len(values[0]):
        product = 1
        for x_pos in range(x,x+4):
            product = product * values[x_pos][y]
        products.append(product)

        product = 1
        if y-4 > 0:
            for i in range(0, 4):
                 product = product * values[x+i][y-i]
            products.append(product)

   #Down and accross + down
    if y+4 < len(values):
        product = 1
        for y_pos in range(y,y+4):
            product = product * values[x][y_pos] 
        products.append(product)

        product =1
        if x+4 < len(values[0]):
            for i in range(0,4):
                product = product * values[x+i][y+i]
            products.append(product)
    
    return max(products)


def read_matrix():
    file = open("Solution11.dat",'r')
    values = []
    file.seek(0)
    for line in file:
        row_vals = line.split()
        row = []
        for col in range(len(row_vals)):
            row.append(int(row_vals[col]))
        values.append(row)
    return values


if __name__ == '__main__':
    main()

    