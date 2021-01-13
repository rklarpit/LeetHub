class Solution(object):
    def numUniqueEmails(self, emails):
        """
        :type emails: List[str]
        :rtype: int
        """
        email_list = set()
        for item in emails:
            local, domain = item.split('@')
            local = local.replace('.', '').split('+')[0]
            email = local+'@'+domain
            email_list.add(str(email))
            
        return len(email_list)
            
