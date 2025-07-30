class Solution:
    def decodeMessage(self, key: str, message: str) -> str:
        hkey = {' ': ' '}
        curr = 'a'
        for c in key:
            if c not in hkey:
                hkey[c] = curr 
                curr = chr(ord(curr)+1)
                if ord('z')+1 == curr:
                    break

        return ''.join( [hkey[c] for c in message] )
        
