fun double x = 2*x
fun incr x = x+1
val a_touple = (double, incr, double(incr 7))
val eighteen = (#1 a_touple) 9

fun n_times(f, n, x) =
  if n=0
  then x
  else f(n_times(f, n-1, x))
fun addition(n, x) = n_times(fn x=>x+1, n, x)
fun double_n(n, x) = n_times((fn x=>x+x), n, x)

(* test *)
val x1 = n_times(double, 4, 7)
val x3 = n_times(tl, 2, [1,2,3,4])


fun map (f, xs) =
  case xs of
       [] => []
     | x::xs' => (f x)::map(f, xs')

val x1 = map((fn x=>x+1), [4,8,12,16])
val x2 = map(hd, [[1,2],[3,4],[5,6,7]])


fun filter (f, xs) =
  case xs of
       [] => []
     | x::xs' => if f x
                 then x :: (filter (f,xs'))
                 else filter(f, xs')

fun is_even v = (v mod 2 = 0)
fun all_even xs =filter(is_even, xs)
fun all_even_snd xs = filter((fn(_,v)=>is_even v), xs)


fun double_or_triple f =
  if f 7
  then fn x=>x*2
  else fn x=>x*3

val double = double_or_triple (fn x=>x-3=4)


fun all_shorter_than_1 (xs, s) =
  filter((fn x=> String.size x< (print "!\n"; String.size s)), xs)
fun all_shorter_than_2 (xs, s) =
  let val i = (print "!\n"; String.size s)
  in
    filter ((fn x => String.size x< i), xs)
  end


fun fold (f, acc, xs) =
  case xs of
       [] => acc
     | x::xs' => fold(f, f(acc, x), xs')

fun compose(f, g) = fn x => f(g x)

infix |>
fun x |> f = f x
fun sqrt_of_abs i =  i |> abs |> Real.fromInt |> Math.sqrt 

fun backup1 (f,g) = fn x => case f x of
                                 NONE => g x
                               | SOME y => y
fun backup2 (f,g) = fn x => f x handle _ => g x

fun sorted_nicer x y z = z>=y andalso y>=x








