import System.Environment
import Data.List (transpose)
import Data.Char (digitToInt)

type Number = String
type Rating = Number
type Output = Int
type Digit = Char

main :: IO ()
main = do
    solve

parseFile :: String -> IO ([Number])
parseFile filename = lines <$> readFile filename

solve :: IO ()
solve = do
    filename <- head <$> getArgs
    nums <- parseFile filename
    let oxygenRating = binToDec $ getRating nums '1' 0
        co2Rating    = binToDec $ getRating nums '0' 0
    print $ getRating nums '1' 0
    print $ getRating nums '0' 0
    print $ oxygenRating * co2Rating

not :: Digit -> Digit
not '0' = '1'
not '1' = '0'

binToDec :: Number -> Output
binToDec = foldl (\acc b -> 2*acc + (digitToInt b)) 0

moreCommonBit :: [Digit] -> Digit
moreCommonBit xs = case (2 * numBits '1') `compare` (length xs) of
                     GT  -> '1'
                     LT  -> '0'
                     EQ  -> '2'
    where numBits b = length $ filter (==b) xs

getRating :: [Number] -> Digit -> Int -> Rating
getRating [num] _ _     = num
getRating nums pref i = let nums' = filter ((==b) . (!!i)) nums
                         in getRating nums' pref (i+1)
                        where b = case moreCommonBit $ map (!!i) nums of
                                    '1' -> if pref=='1' then '1' else '0'
                                    '0' -> if pref=='0' then '1' else '0'
                                    '2' -> pref

