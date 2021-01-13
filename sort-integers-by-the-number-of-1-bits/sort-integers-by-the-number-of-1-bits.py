class Solution(object):
    def sortByBits(self, arr):
        """
        :type arr: List[int]
        :rtype: List[int]
        """
​
        dict_bits = {item: str(bin(item)).count('1') for item in arr}
        sorted_list = (sorted(dict_bits.items(), key=lambda x: (x[1],x[0]), reverse=False))
        return ([t for item in [[item[0]]*arr.count(item[0]) for item in sorted_list] for t in item])
