(*
 * Zadanie domowe 1, czesc 1
 *  structure file
 *)
structure foo :> PART_ONE =
struct
  exception NotImplemented

  datatype 'a tree= Leaf of 'a | Node of 'a tree * 'a * 'a tree (*struktura składa się z 2 poddrzew i el może być dowolnego typu*)

  fun sum n =
    if n = 1 then
      1
    else
      sum (n-1) + n;

  fun fac n =
    if n = 1 then
      1
    else
      n * fac (n-1)

  fun fib n =
    if n <= 2 then
      1
    else
      fib(n-1) + fib(n-2)

  fun gcd (n,m) =
    if n=m then
      m
    else
      if n > m then
        gcd(m,n-m) (*nowa para składa się z liczby mniejszej i różnicy*)
      else
        gcd(n,m-n)

  fun max (l:int list) =
    case l of (*wybieramy akcję casey*)
      nil => 0
    | head :: tail =>     (*jeżeli dodajemy head na tail == lista nie jest pusta to:*)(*wzorowane na algo liczącym dł*)
        if tail = [] orelse head > max (tail) (*head jest maxem jeśli lista jest 1 el lub jeśli jest większy od wszystkich el*)
        then head
        else max (tail)

  fun sumTree (t:int tree) =
    case t of
      Leaf le => le (*dla pojedynczych el po prostu je zwraca*)
    | Node (l,v,r) => v + sumTree (l) + sumTree (r) (*rek rozwijamy gałęzie*)

  fun depth (t:'a tree) =  (*dzewo dowolnego typu danych*)
    case t of
      Leaf le => 0 (*jak jedno el to nie ma zagnieżdżeń*)
    | Node (l, _, p) =>
        1 + (fn (x,y) => if x>y then x else y)(depth (l),depth (p)); (*zwraca większą z głębokości i dodaje 1 bo poziom na którym jesteśmy*)
          (*taka jakby lambda*)

  fun binSearch (t:int tree) (x:int) =
    case t of
      Leaf l => l=x (*jak jeden el to tylko jego sprawdzamy*)
    | Node (l,v,r) =>
        if x=v then true (*sprawdzamy korzen*)
        else if x<v then binSearch l x (*jak mniejszy to spr l jak większy to prawą =>własność drzewa*)
            else binSearch r x

  fun preorder (t:'a tree) = (*korzeń lewe prawe*)
    case t of
      Leaf l => [l] (*jeden no to jeden element odwiedzamy*)
    | Node(l,v,r) => [v] @ preorder (l) @ preorder (r) (*@ składa listy*)

  fun listAdd [] (b:int list) = b (*jeśli z którejś strony jest pusty to zwracamy drugi*)
  | listAdd  (a:int list) [] = a  (*jeśli z którejś strony jest pusty to zwracamy drugi*)
  | listAdd  (a:int list as ha :: ta) (b:int list as hb :: tb) =
      (ha + hb) :: listAdd ta  tb (*sumujemy pierwsze el list , składamy je z wywołaniem dla list o 1 mniejszych*)


  fun insert (m:int) [] = [m] (*rozbieramy naszą listę i szukamy el od którego m jest mniejszy jak jest to go za nim wstawiamy*)
  | insert (m:int) (l:int list as h::t) =
      if m < h then m :: l
      else h :: insert m t  (*naprawiamy naszą listę tzn szukając odcinaliśmy kolejne el więc teraz rek je nakładamy*)

  fun insort (l:int list) =
    let
      fun sort [] res = res (*jak puste to puste*)
        | sort (h::t) res = sort t (insert h res) (*wkładamy el zdjęty z góry w listę na odpowiednie miejsce za każdym razem zmniejszając samą listę*)
    in
      sort l nil
    end

  fun compose f g  = (fn x => g (f (x)))

  fun curry f x y  =  f(x,y)
  fun uncurry f (x,y) = f x y
  fun multifun f n =
    if n = 1 then
      fn x => f x (*wykonujemy f od x raz*)
    else
      fn x =>f ( (multifun f (n-1)) x ) (*rekurencyjnie wykonujemy f od x(za x dajemy wynik poprzedniego wywołania) n-1 razy*)

  fun ltake _ 0 = [] (*sprawdzamy czy lista nie jest pusta lub czy nie mamy pobrac 0 el*)
    |ltake [] _ = []
    |ltake (x::xs) n = x::(ltake xs (n-1)) (*dopisujemy x do kolejnych zdjętych xów aż n się skończy*)

  fun lall _ [] = true (*dla pustej listy zawsze true*)
    |lall f (x::xs)= if (f x) then (lall f xs) else false (*jesli wyrazenie f x da wartosc true mozemy kontynuowac jak się gdziekolwiek wysypie to false i konczymy*)

  fun lmap _ [] = [] (*dla pustej pustą*)
    |lmap f (x::xs)= (f x)::(lmap f xs) (*rozkładamy i składamy liste na kazdym el wykonując funkcję f*)

  fun lrev [] = [] (*dla pustej pustą*)
    |lrev (x::xs) = (lrev xs) @ [x] (*wystarczy składać dowolnie tylo wtedy trzeba @ bo :: zawsze daje na początek*)

  fun lzip ([],_) = []
    |lzip (_,[]) = []    (*jeżeli którakolwiek jest pust to zwracamy pustą*)
    |lzip ((x::xs),(y::ys)) = (x,y)::(lzip (xs,ys)) (*składamy odcięte el w pary i sklejamy*)

  fun split [] = ([],[])
    |split [x] = ([x],[]) (*warunki początkowe*)
    |split (x1::x2::xs) = let val (x1s,x2s) = split xs (* rozbijamy na 2 el i resztę*) (*reszte rozdzielam na dwie listy dopinam do el i mam*)
                          in ((x1::x1s),(x2::x2s)) end;
  fun cartprod _ [] = [] (*jak puste to puste*)
    |cartprod [] _ = []
    |cartprod (x::xs) ys = (lmap (fn y=> (x,y)) ys) @ (cartprod xs ys) (*dostajemy parę układamy ją sobie lmap-em i dopinamy do niej kolejne wywołania*)

end
