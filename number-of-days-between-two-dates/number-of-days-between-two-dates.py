import datetime as dt
class Solution(object):
    def daysBetweenDates(self, date1, date2):
        """
        :type date1: str
        :type date2: str
        :rtype: int
        """
        date1_date =  dt.datetime.strptime(date1, '%Y-%m-%d')
        date2_date =  dt.datetime.strptime(date2, '%Y-%m-%d')
        date_delta = date2_date - date1_date
        return  abs(date_delta.days)
