#define _STR(X...)              #X
#define STR(X...)               _STR(X)

#define _COUNT(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _N, X...) _N
#define COUNT(X...)             _COUNT(, ##X, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)

#define _CAT(A, B)              A ## B
#define CAT(A, B)               _CAT(A, B)

#define LIST_0()
#define LIST_N(...)             Package () { __VA_ARGS__ }
#define LIST_1(X...)            LIST_N(X)
#define LIST_2(X...)            LIST_N(X)
#define LIST_3(X...)            LIST_N(X)
#define LIST_4(X...)            LIST_N(X)
#define LIST_5(X...)            LIST_N(X)
#define LIST_6(X...)            LIST_N(X)
#define LIST_7(X...)            LIST_N(X)
#define LIST_8(X...)            LIST_N(X)
#define LIST_9(X...)            LIST_N(X)
#define LIST(X...)              CAT(LIST_, COUNT(X))(X)

#define DSD_ENTRY(UUID)         ToUUID (STR(UUID)), Package ()
#define PROPS                   DSD_ENTRY(daffd814-6eba-4d8c-8a91-bc9bbf4aa301)
#define SUBNODES                DSD_ENTRY(dbb8e3e6-5886-4ba6-8795-1319f52a966b)
#define SUBNODE(NAME, ACPINAME) Package () { NAME, ACPINAME },

#define PROP_0(N, V...)
#define PROP_N(N, V...)         Package () { N, V },
#define PROP_1(N, V...)         PROP_N(N, V)
#define PROP_2(N, V...)         PROP_N(N, V)
#define PROP_3(N, V...)         PROP_N(N, V)
#define PROP_4(N, V...)         PROP_N(N, V)
#define PROP_5(N, V...)         PROP_N(N, V)
#define PROP_6(N, V...)         PROP_N(N, V)
#define PROP_7(N, V...)         PROP_N(N, V)
#define PROP_8(N, V...)         PROP_N(N, V)
#define PROP_9(N, V...)         PROP_N(N, V)
#define PROP(N, X...)           CAT(PROP_, COUNT(X))(N, X)

#define _WRAP_0(...)
#define _WRAP_1(...)            __VA_ARGS__
#define _WRAP(N, ...)           _WRAP_##N(__VA_ARGS__)
#define WRAP(N, ...)            _WRAP(N, __VA_ARGS__)

#define PIN_SUBNODE(N, HEX, NN) WRAP(N##_PRESENT, SUBNODE(STR(pin@HEX), STR(NN)))
#define PIN_SUBNODES(NM, H1, H2, N1, N2)                                                \
        PIN_SUBNODE(NM, H1, N1) PIN_SUBNODE(NM##P, H1, N1) PIN_SUBNODE(NM##N, H2, N2)

#define _PIN_NODE(NM, NN, N)                                                    \
        Name (NN, Package () {                                                  \
            PROPS {                                                             \
                PROP("reg", 0x##N)                                              \
                PROP("label", CAT(NM,_LABEL))                                   \
                PROP("connection-type", CAT(NM,_TYPE))                          \
                PROP("esync-control", CAT(NM,_ESYNC))                           \
                PROP("ref-sync-sources", LIST(CAT(NM,_REFSYNC)))                \
                PROP("supported-frequencies-hz", LIST(CAT(NM,_FREQS)))          \
            }                                                                   \
        })
#define PIN_NODE(NM, NN, N)     WRAP(NM##_PRESENT, _PIN_NODE(NM, NN, N))
#define PIN_NODES(NM, H1, H2, N1, N2)                                                   \
        PIN_NODE(NM, N1, H1) PIN_NODE(NM##P, N1, H1) PIN_NODE(NM##N, N2, H2)
