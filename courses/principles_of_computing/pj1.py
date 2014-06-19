"""
Clone of 2048 game.
"""

import poc_2048_gui     

# for testing
import poc_simpletest

# Directions, DO NOT MODIFY
UP = 1
DOWN = 2
LEFT = 3
RIGHT = 4

# Offsets for computing tile indices in each direction.
# DO NOT MODIFY this dictionary.    
OFFSETS = {UP: (1, 0), 
           DOWN: (-1, 0), 
           LEFT: (0, 1), 
           RIGHT: (0, -1)} 
   
def merge(line):
    """
    Helper function that merges a single row or column in 2048
    """
    result = [0 for i in range(len(line))]
    ptr = 0
    merged = True
    for num in line:
        #print num, merged, ptr, result
        if num == 0:
            continue
        else:
            if merged:
                result[ptr] = num
                ptr += 1
                merged = False
            elif result[ptr-1] == num:
                result[ptr-1] += num
                merged = True
            else:
                result[ptr] = num
                ptr += 1
    return result

class TwentyFortyEight:
    """
    Class to run the game logic.
    """

    def __init__(self, grid_height, grid_width):
        # replace with your code
        pass
    
    def reset(self):
        """
        Reset the game so the grid is empty.
        """
        # replace with your code
        pass
    
    def __str__(self):
        """
        Return a string representation of the grid for debugging.
        """
        # replace with your code
        pass

    def get_grid_height(self):
        """
        Get the height of the board.
        """
        # replace with your code
        return 0
    
    def get_grid_width(self):
        """
        Get the width of the board.
        """
        # replace with your code
        return 0
                            
    def move(self, direction):
        """
        Move all tiles in the given direction and add
        a new tile if any tiles moved.
        """
        # replace with your code
        pass
        
    def new_tile(self):
        """
        Create a new tile in a randomly selected empty 
        square.  The tile should be 2 90% of the time and
        4 10% of the time.
        """
        # replace with your code
        pass
        
    def set_tile(self, row, col, value):
        """
        Set the tile at position row, col to have the given value.
        """        
        # replace with your code
        pass

    def get_tile(self, row, col):
        """
        Return the value of the tile at position row, col.
        """        
        # replace with your code
        return 0
 
    
#poc_2048_gui.run_gui(TwentyFortyEight(4, 4))


# for testing function "merge"
def test_merge():
    """
    Some informal testing code
    """
    
    # create a TestSuite object
    suite = poc_simpletest.TestSuite()
    
    # test the initial configuration of the board using the str method
    suite.run_test(merge([2, 0, 2, 4]), [4, 4, 0, 0], "Test #1: ")
    suite.run_test(merge([0, 0, 2, 2]), [4, 0, 0, 0], "Test #2: ")
    suite.run_test(merge([2, 2, 0, 0]), [4, 0, 0, 0], "Test #3: ")
    suite.run_test(merge([2, 2, 2, 2]), [4, 4, 0, 0], "Test #4: ")
    suite.run_test(merge([8, 16, 16, 8]), [8, 32, 8, 0], "Test #5: ")

    # report number of tests and failures
    suite.report_results()
test_merge()
