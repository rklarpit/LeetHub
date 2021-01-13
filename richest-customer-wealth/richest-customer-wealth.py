class Solution(object):
    def maximumWealth(self, accounts):
        """
        :type accounts: List[List[int]]
        :rtype: int
        """
        sums = 0
        for item in accounts:
            items_sum = sum(item)
            if sums < items_sum:
                sums = items_sum
        return sums
