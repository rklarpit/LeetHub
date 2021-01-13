class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        for e,i in enumerate(nums):
            for f,j in enumerate(nums[e+1:]):
                sum = i + j
                if sum == target:
                    return [e,f+e+1]
            
