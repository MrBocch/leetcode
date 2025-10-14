import os
from collections import Counter
from math import log10
import random
import matplotlib.pyplot as plt

def get_digits():
    os.chdir("../src")
    ns = [ int(n.split("_")[0][0]) for n in os.listdir() ]
    return ns

def freq(xs):
    #      [0,1,2,3,4,5,6,7,8,9]
    freq = [0,0,0,0,0,0,0,0,0,0]
    for n, count in Counter(xs).items():
        freq[n] = count

    return freq[1:]

# Sample data
xs = [1,2,3,4,5,6,7,8,9]
ns = get_digits()
y  = [ ys/len(get_digits()) for ys in freq(ns) ]

plt.grid(True,
         linestyle='--',
         alpha=0.7,
         zorder=-1)          # Lower zorder than bars (default is 2.5 for grid)

# the data
plt.bar(xs, y, label="observed", color="grey", zorder=2)

# Benford's Law expected probabilities
digits = list(range(1, 10))
benford = [log10(1 + 1/d) for d in range(1,10)]
total = sum(y)
benford_counts = [p * total for p in benford]

# line plot
plt.plot(digits, benford, color='red', marker='x', linestyle='-', linewidth=2, label="Benford's Law")

# Add labels and title
plt.xlabel('Initial Digit for Leetcode Problem')
plt.xticks([1,2,3,4,5,6,7,8,9])
plt.ylabel('Percentage %')
plt.title('Leetcode Problems, Benfords Law')
plt.legend()


# Show the graph
plt.show()
