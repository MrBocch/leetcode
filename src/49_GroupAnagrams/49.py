from collections import Counter 
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        dic = {}
        for w in strs:
            key = to_key(w)
            if key not in dic:
                dic[key] = [w]
            else:
                dic[key].append(w)

        return list(dic.values())



def to_key(s):
    return ''.join(sorted(s))