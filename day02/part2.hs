import System.Environment

type Pos = (Int, Int, Int)

main :: IO ()
main = do
    solve

parseFile :: String -> IO ([String])
parseFile filename = lines <$> readFile filename

solve :: IO ()
solve = do
    filename <- head <$> getArgs
    commands <- parseFile filename
    print $ (\(x,d,_) -> x*d) $ finalPosition commands

forward :: Int -> Pos -> Pos
forward n (x,d,a) = (x+n,d+(a*n),a)

down :: Int -> Pos -> Pos
down n (x,d,a) = (x,d,a+n)

up :: Int -> Pos -> Pos
up n (x,d,a) = (x,d,a-n)

readCommand :: String -> (Pos -> Pos)
readCommand s = case (takeWhile (/=' ') s) of
                  "forward" -> forward n
                  "down" -> down n
                  "up" -> up n
                  _ -> error "invalid command"
            where n = (read $ tail $ dropWhile (/=' ') s) :: Int

finalPosition :: [String] -> Pos
finalPosition = foldl (flip readCommand) (0,0,0)
