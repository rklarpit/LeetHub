class Solution(object):
    def reorderSpaces(self, text):
        """
        :type text: str
        :rtype: str
        """
        try:
            spaces = text.count(' ')
            words = text.split()
            num_words = len(words)
            if num_words >1:
                division =  int(spaces/(num_words-1))
                extra = spaces%(num_words-1)
                return (' '*division).join(words) + (' '*extra)
            else:
                return words[0] + (' '*spaces)
        except Exception as e:
            print(e)
            return text
