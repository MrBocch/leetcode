class Solution:
    def getEncryptedString(self, s: str, k: int) -> str:
        slen = len(s)
        return ''.join([ s[(i+k) % slen] for i in range(slen) ])
