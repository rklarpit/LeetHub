class Solution(object):
    def numSpecial(self, mat):
        """
        :type mat: List[List[int]]
        :rtype: int
        """
        y = set()
        x = [[i,j] for i, item in enumerate(mat) for j, t in enumerate(item) if t == 1]
        print(x)
        for i,item in enumerate(x):
            for item2 in x[i+1:]:
                if item2[0]==item[0] or item2[1] == item[1]:
                    y.add(tuple(item2))
                    y.add(tuple(item))
        return len(x)-len(y)
              # for i, item in enumerate(mat):
        #     for j, t in enumerate(item):
        #         if t == 1:
        #             all_i.append(i)
        #             all_y.append
                    
