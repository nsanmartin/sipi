import Alex (alexScanTokens)

main :: IO ()
main = do
  tokens <- alexScanTokens <$> getContents
  print tokens
