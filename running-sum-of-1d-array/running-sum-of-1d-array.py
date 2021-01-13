class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        runningSum = []
        
        #return [runningSum.append(item) for i, item in enumerate(nums) if not runningSum else  runningSum.append(runningSum[i-1] + item)]
        for i, item in enumerate(nums):
            if not runningSum:
                runningSum.append(item)
            else:
                runningSum.append(runningSum[i-1] + item)
        return runningSum
