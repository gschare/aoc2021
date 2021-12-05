import System.Environment

main :: IO ()
main = do
    solve

parseFile :: String -> IO ([String])
parseFile filename = lines <$> readFile filename

solve :: IO ()
solve = do
    filename <- head <$> getArgs
    commands <- parseFile filename
