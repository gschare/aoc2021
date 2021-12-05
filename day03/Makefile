.PHONY: default
default: part1 part2

part1: part1.hs
	ghc -Wall part1.hs

part2: part2.hs
	ghc -Wall part2.hs

.PHONY: clean
clean:
	rm -rf *.o *.hi a.out part1 part2

.PHONY: sample1 sample2 input1 input2
sample1: part1.hs
	runhaskell part1.hs sample.txt

sample2: part2.hs
	runhaskell part2.hs sample.txt

input1: part1.hs
	runhaskell part1.hs input.txt

input2: part2.hs
	runhaskell part2.hs input.txt
