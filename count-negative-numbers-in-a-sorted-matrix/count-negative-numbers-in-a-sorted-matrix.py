class Solution(object):
    def countNegatives(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        return len([item for sublist in grid for item in sublist if item < 0])
