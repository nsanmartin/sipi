{
module Alex (alexScanTokens) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "--".*				;
  \\\#					{ \_ -> LamSharp }
  \\					{ \_ -> Lam }
  "->"					{ \_ -> Arrow }
  "?"					{ \_ -> If }
  :						{ \_ -> Colon }
  "("					{ \_ -> LeftParen }
  ")"					{ \_ -> RightParen }
  ","					{ \_ -> Comma }
  k0					{ \_ -> Ket0 }
  k1					{ \_ -> Ket1 }
  "="					{ \_ -> EqSign }
  proj					{ \_ -> Proj }
  "+"					{ \_ -> Sum }
  let					{ \_ -> Let }
  in					{ \_ -> In }
  $digit+				{ \s -> Int (read s) }
  $alpha [$alpha $digit \_ \']*		{ \s -> Var s }

{

data Token = Lam
           | LamSharp
           | Arrow 
           | If  
           | Colon 
           | RightParen 
           | LeftParen  
           | Comma 
           | Ket0 
           | Ket1 
           | EqSign 
           | Proj 
           | Sum  
           | Let  
           | In   
           | Sym Char
           | Var String
           | Int Int
           deriving (Eq,Show)

}
