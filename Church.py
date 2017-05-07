#MORE FANCY AND MORE ABSTRACT
def to_int(f):
    return f(lambda n: n + 1)(0)


def to_bool(f):
    return f(True)(False)

# defined numerals:
ZERO = lambda f: lambda x: x
ONE = lambda f: lambda x: f(x)
TWO = lambda f: lambda x: f(f(x))
THREE = lambda f: lambda x: f(f(f(x)))
FOUR = lambda f: lambda x: f(f(f(f(x))))
FIVE = lambda f: lambda x: f(f(f(f(f(x)))))
SIX = lambda f: lambda x: f(f(f(f(f(f(x))))))
SEVEN = lambda f: lambda x: f(f(f(f(f(f(f(x)))))))
EIGHT = lambda f: lambda x: f(f(f(f(f(f(f(f(x))))))))
NINE = lambda f: lambda x: f(f(f(f(f(f(f(f(f(x)))))))))
TEN = lambda f: lambda x: f(f(f(f(f(f(f(f(f(f(x))))))))))
# Combinator:
Z = lambda f:   (lambda x: (lambda m: f(x(x)) (m)))    (lambda x: (lambda m: f(x(x))(m))) #???

# Operators:
INCREMENT = lambda n: lambda f: lambda x: f(n(f)(x))
DECREMENT = lambda n: lambda f: lambda x: n(lambda g: lambda h: h(g(f))) (lambda u: x)(lambda u: u)
ADD = lambda m: lambda n: n(INCREMENT)(m)
SUBTRACT = lambda m: lambda n: n(DECREMENT)(m)
MULTIPLY = lambda m: lambda n: lambda f: m(n(f))
POWER = lambda m: lambda n: n(m)
MOD =  Z( lambda f : lambda a : lambda b : IF (LEQ(b)(a)) (lambda x : f(SUBTRACT(a)(b)) (b) (x))     (a) )

# Bools:
TRUE = lambda p: lambda q: p
FALSE = lambda p: lambda q: q
IF = lambda f: f
AND = lambda a: lambda b: a(b)(FALSE)
OR = lambda a: lambda b: a(TRUE)(b(TRUE)(FALSE))
NOT = lambda f: f(FALSE)(TRUE)
IS_ZERO = lambda n: n(lambda x: FALSE)(TRUE)


# Comparators:
LEQ = lambda m: lambda n: IS_ZERO(SUBTRACT(m)(n))
EQ = lambda m: lambda n: AND(LEQ(m)(n))(LEQ(n)(m))
GT = lambda m: lambda n: NOT(LEQ(m)(n))
GEQ = lambda m: lambda n: OR(GT(m)(n))(EQ(m)(n))
LT = lambda m: lambda n: NOT(GEQ(m)(n))


# Pairs:
PAIR = lambda x: lambda y: lambda f: f(x)(y)
FIRST = lambda p: p(lambda x: lambda y: x)
SECOND = lambda p: p(lambda x: lambda y: y)


# Lists:
NIL = PAIR(TRUE)(TRUE)
IS_EMPTY = FIRST
LIST = lambda h: lambda t: PAIR(FALSE)(PAIR(h)(t))
HEAD = lambda p: FIRST(SECOND(p))
TAIL = lambda p: SECOND(SECOND(p))

INSERT = lambda l : lambda x : PAIR (x) (PAIR(x)(l)) #dodaje el

RANGE = Z(lambda f: lambda m: lambda n: IF(LEQ(m)(n))(lambda x: LIST(m)(f(INCREMENT(m))(n))(x))    (NIL))

FOLD = Z(lambda f: lambda l: lambda x: lambda g:IF(IS_EMPTY(l))(x)(lambda y: g(f(TAIL(l))(x)(g))(HEAD(l))(y)))

MAP = lambda k: lambda f: FOLD(k)(NIL)(lambda l: lambda x: LIST(f(x))(l))


#znajdowanie max
MAX = lambda l: FOLD (l) (ZERO)  (lambda t: lambda x: IF(GT (t) (x))(t)(x))

#ALGORYTM EUKIDESA
NWD = lambda a: lambda b: \
    IF(EQ(a)(b))(a)(
        IF(GT (a) (b))
            (lambda x:   NWD (SUBTRACT(a)(b))   (b)              (x))
            (lambda x:   NWD (a)         (SUBTRACT(b)(a))        (x))
    )

print(to_int(NWD(EIGHT)(FOUR))) #NWD TEST
print(to_int(MAX(RANGE (THREE)(TEN)))) #MAX TEST
