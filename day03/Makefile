CC=gcc -g -Wall

.PHONY: default
default: part1 part2

part1:

part2: part2.hs
	ghc part2.hs -o part2

.PHONY: clean
clean:
	rm -f *.o *.hi a.out part1 part2
