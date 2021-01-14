class Solution(object):
    def isAlienSorted(self, words, order):
        """
        :type words: List[str]
        :type order: str
        :rtype: bool
        """
        for num, item in enumerate(words[:-1]):
            for num2, letter in enumerate(item):
                if num2+1 <= len(words[num+1]):
                    if order.index(letter) < order.index(words[num+1][num2]):
                        break
                    elif order.index(letter) > order.index(words[num+1][num2]):
                        return False
                else:
                    return False
        print('outside')
        return True
                
