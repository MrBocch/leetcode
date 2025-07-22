from collections import defaultdict 

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagrams = defaultdict(list)
        for w in strs:
            key = to_key(w)
            anagrams[key].append(w)

        return list(anagrams.values())

def to_key(s):
    return ''.join(sorted(s))
