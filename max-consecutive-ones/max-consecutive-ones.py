class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        n = max_count = 0        
        for item in nums:
            if item ==1:
                n+=1
            else:
                 # Find the maximum till now.
                max_count = max(max_count, n)
                # Reset count of 1.
                n = 0
        return max(max_count, n)
    
