#!/usr/bin/python

#Lattice Paths
#Moving only right and down in a matrix, find the number of paths from
#[0,0] t0 [n,n]

# Simple recursive solution to search all paths is very slow but much more elegant
# Observe that the # of paths to the top and left edge points is 1 and that the
# paths to all other points are the sum of the paths to the nodes above and to the left

import sys
matrix_size = 20

#Preload the matrix
paths_to_node = {(0,0):0, (1,0):1, (0,1):1, (1,1):2}

def main():
    print "Number of lattice paths for a %dx%d matrix\n" % (matrix_size, matrix_size)
    for i in range(2,matrix_size+1):
        calculate_paths_to_for_matrix_of_size(i)
    path_count = paths_to_node.get((matrix_size,matrix_size))
    print "The path count for a %dx%d matrix is %d" % (matrix_size, matrix_size, path_count)

def calculate_paths_to_for_matrix_of_size(size):
    for i in range(0,size):
        paths_to_node[(i,size)] = 0
        paths_to_node[(size,i)] = 0

        if(i == 0):  #An edge 
            paths_to_node[(i,size)] = 1
            paths_to_node[(size,i)] = 1
        else: #An inide point
            paths_to_node[(i,size)] = paths_to_node[(i,size-1)] + paths_to_node[(size,i-1)]
            paths_to_node[(size,i)] = paths_to_node[(size-1,i)] + paths_to_node[(i-1,size)]
    
    paths_to_node[(size,size)] = paths_to_node[(size-1,size)] + paths_to_node[(size,size-1)]


    
if __name__ == '__main__':
    main()