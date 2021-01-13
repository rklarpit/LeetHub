class Solution(object):
    def minOperations(self, logs):
        """
        :type logs: List[str]
        :rtype: int
        """
        location = 0
        for item in logs:
            if item == '../':
                if location > 0:
                    location-=1
            elif item == './':
                pass
            else:
                location+=1
                
        return location
