import System.Environment

main :: IO ()
main = do
    solve

relChange :: [Int] -> [Int]
relChange xs = zipWith (\x y -> y - x) xs (tail xs)

countInc :: [Int] -> Int
countInc = length . filter (>0)

parseFile :: String -> IO ([Int])
parseFile filename = map read . lines <$> readFile filename

solve :: IO ()
solve = do
    filename <- head <$> getArgs
    xs <- parseFile filename
    print . countInc . relChange $ xs
