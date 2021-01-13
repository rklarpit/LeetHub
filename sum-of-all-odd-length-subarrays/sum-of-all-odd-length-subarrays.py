class Solution(object):
    def sumOddLengthSubarrays(self, arr):
        """
        :type arr: List[int]
        :rtype: int
        """
        length = len(arr)
        i = 1
        sum_r = 0
        while i <= length:
            for item in range(length):
                arr2 = (arr[item:item+i])
                if len(arr2) == i:
                    sum_r = sum_r +sum(arr2)
                else: 
                    break
            i = i+2
        return sum_r
        
        
