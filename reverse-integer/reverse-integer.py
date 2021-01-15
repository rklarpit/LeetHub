class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        if x<=(2**31 -1) and x >= -(2**31):
            if x > 0:
                y = int(str(x)[::-1])
            elif x<0:
                y = int(str(abs(x))[::-1])*-1
            else:
                y = 0
        else:
            y = 0
        if y<=(2**31 -1) and y>=-(2**31):
            return y
        else:
            return 0
