print("Srushti Sanghani - 53003220007")
import itertools, random

deck = list(itertools.product(range(1,14),['Heart','Diamond','Club','Spade']))
for i in range(5):
    print(deck[i][0],"of",deck[i][0])

random.shuffle(deck)
print("\nYou got \n")
for i in range(5):
    print(deck[i][0], "of", deck[i][1])
