Theorem:
    $
        sum_(i=0)^m 2^i = 2^(m+1)-1
    $

Beweis:
+ Induktionsanfang: Für $m=0$:#h(1fr)

    $
        sum_(i=0)^0 2^i &= 2^(0+1)-1 \
        2^0 &= 2^1 - 1 \
        1 &= 1
    $

+ Induktionsvoraussetzung: Angenommen, die Gleichung gelte für ein gewisses $m$:

    $
        sum_(i=0)^m 2^i = 2^(m+1)-1
    $

+ Induktionsschritt: Daher gilt sie auch für ein beliebiges $k=m+1$:

    $
        sum_(i=0)^(k) 2^i &= 2^(k+1)-1 #h(1cm)&&| k = m+1 \
        sum_(i=0)^(m+1) 2^i &= 2^(m+1+1)-1 \
        2^(m+1) + sum_(i=0)^(m) 2^i &= 2 dot 2^(m+1)-1 \
        2^(m+1) + sum_(i=0)^(m) 2^i &= 2 dot 2^(m+1)-1 &&| -2^(m+1) \
        sum_(i=0)^(m) 2^i &= 2^(m+1)-1 &&| -2^(m+1) \
    $

    Das ist nach Induktionsvoraussetzung wahr. Daher ist das Theorem gültig.
