#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#import "@preview/polylux:0.4.0": *

#import "@preview/pillar:0.3.2"
#import "@preview/grape-suite:4.0.0": slides
#import slides: *

#import "latex_symbol.typ": latex-symbol, tex-symbol

#show "La!!TeX": [La] + [!TeX]
#show "La!TeX": [#h(-0.2em)#latex-symbol#h(-0.3em)]
#show "Te!X": [#h(-0.2em)#tex-symbol#h(-0.3em)]

#let task = task.with(title: [Aufgabe #counter("task-counter").step()#context counter("task-counter").display()])

#set text(lang: "de")

#show: slides.with(
    series: [Hat La!TeX ausgedient?],
    title: [Eine kleine Einführung in Typst],
    no: none,

    author: [Tristan Pieper (#link("mailto:tristan.pieper@uni-rostock.de"))],
    footer: text(
        size: 0.5em,
    )[Hat La!TeX ausgedient? Eine kleine Einführung in Typst -- Tristan Pieper (#link("mailto:tristan.pieper@uni-rostock.de"))],
    date: datetime(year: 2026, month: 5, day: 26),

    outline-title-text: [Inhalt],
    show-outline: false,
)

#show: codly-init.with()
#codly(fill: white.darken(5%).transparentize(50%), zebra-fill: white.transparentize(50%))

#let red = rgb("#ff0000")
#let green = rgb("#00ff00")
#let hs = h(0.16em)

#let otask = task
#let osolution = solution

// #let task(..a, body, solution) = (
//     otask(title: [Aufgabe #counter("tasks").step()#context counter("tasks").display()], body, ..a)
//         + slide(osolution(title: [Lösungsvorschlag #context counter("tasks").display()], solution))
// )

#let part(title) = focus-slide({
    // [#counter(heading).step()#context (counter(heading).get().first()). ]
    box(heading(outlined: true, level: 1, text(fill: white, title)))
})

#let layout-2v1h(a, b) = grid(
    columns: 2,
    column-gutter: 1em,
    a, b,
)

#set heading(outlined: false)

// #part("Kurzes Kennenlernen")
/*
- Wer hat schonmal LaTeX benutzt? → Ihr werdet euch glücklich schätzen
- Wer hatte das IP-Modul? → Macht es einfacher
*/

#part[
    La!TeX: die Motivation\ für Typst
]

#slide[
    = Wer Te!X#h(-0.16em)t seine Hausaufgaben?
]

#slide[
    = Wer Te!X#h(-0.16em)t seine Hausaufgaben?
    //#show: later
    #show image: block.with(stroke: 1pt)
    #show image: set align(center)
    #set align(horizon)

    #grid(
        columns: (40%, 1fr),
        column-gutter: 1em,
        [Ich seit dem 2. Semester nicht mehr...], image("img/eti-beispiel.png", height: 1fr),
    )
]
#slide[
    = Ein kleiner Appetizer
    #show image: block.with(stroke: 1pt)
    #set align(center)

    #grid(
        columns: 2,
        column-gutter: 1em,
        image("img/ha-1.svg", height: 1fr), image("img/ha-5.svg", height: 1fr),
    )
]

#slide[
    #show image: block.with(stroke: 1pt)
    #set align(horizon + center)
    #figure(block(height: 70%, stack(
        dir: ltr,
        spacing: 1em,
        image("img/kuek/kuek1.svg"),
        image("img/kuek/kuek30.svg"),
        image("img/kuek/kuek54.svg"),
    )))
]

#slide[
    #show image: block.with(stroke: 1pt)
    #set align(horizon + center)
    #figure(stack(
        dir: ltr,
        spacing: 1em,
        image("img/petrinetze/petrinetze-notizen11.svg"),
        image("img/petrinetze/petrinetze-notizen14.svg"),
    ))
]

#slide[
    #show image: block.with(stroke: 1pt)
    #set align(horizon + center)
    #figure(stack(
        dir: ltr,
        spacing: 1em,
        image("img/knobelei36.svg"),
        image("img/knobelei37.svg"),
    ))
]

#focus-slide[
    #set align(horizon + left)
    #set text(size: 24pt, weight: "regular")
    = #text(fill: white, [Plan für heute])
    + Geschichte und Probleme
    + Grundlegende Formatierung
    + Größere Projekte und Templates
    + States, Counter, Context
    + Typst Universe: Pakete
]

#slide[
    = Alles begann mit...

    #set align(horizon)
    #grid(columns: 2, column-gutter: 0em)[
        #block(height: 1fr, image("img/donald_e_knuth.png", height: 100%))
    ][
        #v(1fr)
        *Donald E. Knuth* \
        #set text(size: 0.75em)
        (geb. 10. Januar 1938) \

        #v(1fr)
        Foto: Brian Flaherty / The New York Times
    ]


    /*
    - Autor von TeX und METAFONT, entwickelt ab 1977
    - bekanntestes Werk neben TeX: The Art of Computer Programming
    - TeX extra für sein Buch entwickelt, weil er besondere ästhetische Ansprüche hatte, die die Verleger nicht erfüllen konnten
    */
]

#slide()[
    = Dann kam...

    #set align(horizon)
    #grid(columns: 2, column-gutter: 0em)[
        #block(height: 1fr, image("img/leslie_lamport.png", height: 100%))
    ][
        #v(1fr)
        *Leslie Lamport* \
        #set text(size: 0.75em)
        (geb. 7. Februar 1941) \

        #v(1fr)
        Foto: Talia Herman / Quanta Magazine
    ]

    /*
    - Autor von LaTeX, entwickelt ab Anfang 1980
    - LaTeX als Sammlung von Makros zur Erweiterung und Vereinfachung von TeX
    */
]

#slide[
    = 40 Jahre später...
    ... wird aus Frustration an La!TeX Typst geboren.

    #set align(horizon)
    #grid(
        columns: (auto, auto, auto, auto),
        gutter: 1em,
        [
            #set align(right)
            *Martin Haug*\
            #set text(size: 0.75em)
            // (Webentwicklung)
        ],
        [
            #image(height: 50%, width: auto, "img/martin_haug.png")
        ],
        [
            #image(height: 50%, width: auto, "img/laurenz_maedje.png")
        ],
        [
            #set align(left)
            *Laurenz Mädje*\
            #set text(size: 0.75em)
            // (Compilerentwicklung)
        ],
    )

    #v(1fr)
    #set text(size: 0.5em)
    Fotos: #link("https://typst.app/about/"), letzter Zugriff: 26.05.2023, 10:16 Uhr
]

#slide[
    = Probleme mit La!TeX?
    #set text(size: 0.95em)
    + Größe des Programmes: groß
    + Auswahl an Compilern: unübersichtlich
    + Fehlermeldungen: unverständlich
    + Geschwindigkeit der Kompilierung: langsam
    + Hilfsdateien (\*.aux, \*.log, \*.toc, \*.idx, ...)

    #set text(size: 0.85em)
    #quote(attribution: [Michael Pass, Schüler von Donald Knuth], block: true)[
        "Don tried very hard not to make TeX a programming language. Unfortunately, he didn't succeed."#footnote[Norman Ramsey: Stackoverflow. https://stackoverflow.com/questions/1931238/if-tex-is-a-programming-language-how-could-i-start-programming-in-tex, letzter Zugriff: 1.6.2025, 11:39 Uhr.]
    ]
]

#slide[
    = Problem 1: Größe des Programms#footnote[Gemessen anhand des Paketes `texlive` der Debian-Repositorys und dem `typst`-Paket von `cargo`, April 2025.]

    #set align(center + horizon)
    #table(
        stroke: none,
        inset: 0.25em,
        ..pillar.cols("l|ll"),

        table.header[*Programm*][*Aspekt*][*Größe*],
        table.hline(),
        table.cell(rowspan: 3)[LaTeX],
        [Basis],
        table.vline(end: 3),
        [$approx$ `500`#hs;`MB`],
        [Zusatzpakete, Schriften, ...], [$approx$ `3`#hs;`GB`],

        table.hline(),
        [$Sigma$], align(left)[$approx$ `3,5`#hs;`GB`],

        table.hline(),
        table.cell(rowspan: 3)[Typst],
        [Compiler],
        table.vline(start: 4, end: 6),
        [$approx$ `40`#hs;`MB`],
        [Pakete#footnote[Bei mir lokal installiert, nur die, die ich verwende, nicht insgesamt alle möglichen.]],
        [$approx$ `15`#hs;`MB`],

        table.hline(),
        [$Sigma$], align(left)[$approx$ `45`#hs;`MB`],
    )

    /*
    - Installationsgrößen können stark variieren, 300MB..7GB
    - unglaublich viele Pakete
    */
]

#slide[
    = Problem 2: Auswahl an Compilern
    „La!TeX“ ist kein Programm, sondern eine Familie:
    - pdfLaTeX
    - LuaTeX
    - ConTeXt
    - XeTeX
    - MikTeX
    - KaTeX
    - ...
]

#slide[
    = Problem 3: Beispiel-Fehlermeldung (Typst)
    #columns(
        2,
        [
            ```typ
            $a+b
            ```
            #colbreak()
            #set text(size: 16pt)
            ```
              error: expected dollar sign
              ┌─ test.typ:1:5
              │
            1 │ $a+b
              │     ^
            ```
        ],
    )
]

#slide[
    = Problem 3: Beispiel-Fehlermeldung (La!TeX)
    #columns(
        2,
        [
            #v(2em)
            La!TeX:

            #set text(size: 22pt)
            ```tex
            \documentclass{article}

            \begin{document}
                $a+b
            \end{document}
            ```

            #colbreak()
            #set text(size: 6pt)

            #raw(read("latex_error.log"))
        ],
    )
]

#slide[
    = Problem 3: Mehr Beispiel-Fehlermeldung
    #set text(size: 18pt)
    #table(
        stroke: none,
        columns: (auto, auto),
        inset: 0.5em,
        [Typst], [La!TeX],
        ```typ
        #set par(leading: [Hello])
                          ^^^^^^^
        expected integer, found content
        ```,
        ```latex
        \baselineskip=Hello
        Missing number, treated as zero.
        Illegal unit of measure (pt inserted).
        ```,

        ```typ
        #heading()
                ^^
        missing argument: body
        ```,
        ```latex
        \section
        Missing \endcsname inserted.
        Missing \endcsname inserted.
        ...
        ```,
    )

    #v(1fr)
    #set text(size: 0.75em)
    Vgl. Mädje, Laurenz: #emph["Typst -- A Programmable Markup Language for Typesetting."] Masterarbeit an der TU Berlin, 2022.
]

#slide[
    = Problem 4: Geschwindigkeit
    - pure functions
    - inkrementelle Kompilierung & Caching
    - Multithreading

    #example(title: [Beispiel])[
        Diese Folien brauchen bei erster Kompilierung $approx$#sym.space.thin;0.7~Sekunden, mit Caching danach $approx$#sym.space.thin;0.2~Sekunden.#footnote[Beim Vortrag im letzten Jahr waren es noch 6 Sekunden / 0,7 Sekunden. ]
    ]
]

#slide[
    = Insgesamt möchte Typst bieten...
    + statt Te!X-Makros moderne Programmiersprache:
        - vollständige Elemente einer Skriptsprache
        - optionaler syntaktischer Zucker à la Markdown

    + Instant-Preview
    + verständliche Fehlermeldungen
    + konsistentes Layoutmodell
]

// #slide[
//     = Mächtigkeit
//     Noch ein Turing-vollständiges Textsatzsystem ...?
//
//     #notice(title: "Fun Fact")[
//         #set text(hyphenate: false)
//         Nur eines der folgenden Dinge ist _nicht_ Turing-vollständig.
//
//         #set text(size: 0.85em)
//         #show: columns
//         - La!TeX
//         - Microsoft Word
//         - C++-Templates
//         - Magic: The Gathering (Kartenspiel)
//         - Minecraft (Videospiel)
//         - Baba Is You (Videospiel)
//         - Microsoft PowerPoint
//         - Typst
//     ]
// ]
//
// #slide[
//     = Mächtigkeit
//     Noch ein Turing-vollständiges Textsatzsystem ...?
//
//     #notice(title: "Fun Fact")[
//         #set text(hyphenate: false)
//         Nur eines der folgenden Dinge ist _nicht_ Turing-vollständig.
//
//         #set text(size: 0.85em)
//         #show: columns
//         - La!TeX
//         - Microsoft Word
//         - C++-Template-Engine
//         - Magic: The Gathering (Kartenspiel)
//         - Minecraft (Videospiel)
//         - Baba Is You (Videospiel)
//         - Microsoft PowerPoint
//         - Typst ←
//     ]
// ]

// #slide[
//     = Mächtigkeit
//     Noch ein Turing-vollständiges Textsatzsystem ...?
//
//     #grid(columns: 2, column-gutter: 1em)[
//         ```typ
//         #let i = 0
//         #while i <= 10000 {
//             i += 1
//         }
//
//         #i
//         ```
//
//         Nein! Nur über _Umwege_.
//
//     ][
//         #set text(size: 0.8em)
//         ```
//           error: loop seems to be infinite
//           ┌─ main.typ:308:5
//           │
//         2 │       #while i <= 10000 {
//           │ ╭──────^
//         3 │ │         i += 1
//         4 │ │     }
//           │ ╰─────^
//         ```
//     ]
// ]

#part[
    Typst als Textsatzsystem
]

// #slide[
//     = Ein Vergleich des Textsatzes
//     #[
//         #set text(size: 10pt)
//         #table(
//             columns: (60%, auto),
//             stroke: none,
//             inset: 1em,
//             raw(lang: "latex", read("Beispiele/MatheDeltaEpsilon/edk_latex.tex")),
//             raw(lang: "typst", read("Beispiele/MatheDeltaEpsilon/edk_typst.typ")),
//         )
//     ]
// ]

#[
    #show image: block.with(stroke: 1pt)
    #slide[
        = Ein Vergleich des Textsatzes
        #figure(image(width: 19cm, "Beispiele/MatheDeltaEpsilon/edk_latex.svg"))
        #figure(image(width: 19cm, "Beispiele/MatheDeltaEpsilon/edk_typst.svg"))
    ]

    #slide[
        = Textsatz formaler Systeme in Typst#footnote[Bildquelle: https://typst.app/universe/package/physica/, letzter Zugriff: 1.6.2025, 9:09 Uhr.]

        #box(width: 1fr, figure(image(height: 70%, "img/bsp_physica.png"))) \
    ]

    #slide[
        #figure(image(height: 100%, "img/bsp_induktion.png"))
    ]
]

#let typst-example(code, code-size: 1em, columns: (1fr, 1fr)) = {
    grid(
        columns: columns,
        column-gutter: 1em,
        row-gutter: 0.5em,

        // text(size: 0.75em)[Typst], text(size: 0.75em)[Output],
        {
            set text(size: code-size)
            yes-codly(if type(code) == str { eval("raw(\"" + code + "\")") } else { code })
        },
        eval(if type(code) == str { code } else { code.text }, mode: "markup")
    )

    codly(enabled: true)
}

#slide[
    = Ressourcen
    - *dieser Vortrag, Aufgaben, Typst-Source*:\ https://github.com/piepert/typst-seminar-26

    - *Typst-Seite, Dokumentation und Templates*:\ https://typst.app/, https://typst.app/docs, https://typst.app/universe

    - *offizielles Typst-Tutorial*:\ https://typst.app/docs/tutorial/

    - *Typst Examples, ein ausführliches Tutorial an Beispielen*:\ https://sitandr.github.io/typst-examples-book/book/
]

#slide[
    #set align(center + horizon)
    = Folien und Inhalte

    #image("img/qrcode_slides.svg", height: 7cm)

    https://shorturl.at/OZ2Kp
]

#slide[
    = Die WebApp
    - ähnlich Overleaf:
        - Cloud-Lösung zur Porjektverwaltung
        - kollaboratives Arbeiten möglich

    #task[
        + Besuchen Sie https://typst.app/ und loggen Sie sich mit dem Account `typst-sose26-`$Phi$`@byom.de` ein ($1 <= Phi <= 15$). Das Passwort wird an die Tafel geschrieben.
        + Duplizieren Sie das Projekt von hier: https://shorturl.at/Mv8E0
    ]
]

#slide[
    = Grundlagen der Formatierung#footnote[https://typst.app/docs/reference/syntax/]#super[,]#footnote[Der Output ist durch die Präsentationsvorlage bereits formatiert. Dies weicht u.a. in Schriftart und Schriftfarbe vom unstilisierten Typst mit Standardwerten ab.]

    #set heading(numbering: "1.", outlined: false)
    #typst-example(```typ
    *Hallo*
    _Hallo_
    = Hallo
    == Hallo
    === Hallo
    ```)
]

#slide[
    = Grundlagen der Formatierung

    #set heading(numbering: "1.", outlined: false)
    #typst-example(columns: (15cm, 5cm), ```typ
    #strong[Hallo]
    #emph[Hallo]
    #heading[Hallo]
    #heading(level: 2, [Hallo])
    #heading(level: 3, [Hallo])
    ```)
]

#slide[
    = Listen (`list`)
    #typst-example(```typ
    - elment 1
    - element 2
    - ...

    + element 1
    + element 2
    + ...
    ```)
]

#slide[
    = Absätze (`par`), Zeilenumbrüche (`linebreak`)
    #typst-example(```typ
    Hallo

    Absatz

    Hallo \ Zeilenumbruch
    ```)
]

#slide[
    = Raw Text (`raw`), Termlisten (`terms`)

    #typst-example(```typ
    // Hier ein Kommentar
    `raw text` ("\`\`\`" für Blöcke)

    / Term 1: #lorem(10)
    / Term 2: Definition ...
    / Term 3: Definition ...
    ```)
]

#slide[
    = Abstände (`h`, `v`)
    #typst-example(```typ
    Hallo #h(2cm) Welt

    #v(2cm)
    Welt

    Leere #h(1fr) aufteilen \
    Leere #h(0.5fr) mehr #h(0.5fr) aufteilen
    ```)
]

#slide[
    #task(time: [5 min.])[
        Im Ordner `Aufgabe 2/` ist ein Beweis vorhanden.
        + Heben Sie relevante Wörter für die Beweisstruktur hervor.
        + Ergänzen Sie das "QED" am Ende des Beweises, sodass es am Ende der Zeile steht.

        *(Zusatz)* Fügen Sie mit dem Befehl `#title[...]` einen Titel am Beginn der Datei hinzu.
    ]
]

#slide[
    = Tabellen, Laden von Daten
    #set text(size: 0.9em)
    - Typst unterstützt Laden von CSV, JSON, TOML, ... (auch Plain Text/Binärdaten)

    #typst-example(columns: (0.8fr, 0.2fr), ```typ
    #table(
        columns: 3,
        [a], [b], [c],
        [d], [e], [f]
    )

    #table(columns: 3,
        ..csv("data.csv").flatten())
    ```)
]

#slide[
    = Mehr zu Tabellen#footnote[https://typst.app/docs/reference/model/table/]
    #grid(
        columns: 2,
        image(width: 90%, "img/table1.png"), image(width: 90%, "img/table2.png"),
    )

    #set text(size: 0.8em)
    // - `table`-Funktion nativ mächtig:
    ```typ
    #table(
        fill: (x, y) => if y == 0 { gray } else { white },
        ...)
    ```
]

#slide[
    = set-Regeln
    - alle Builtins haben Standardargumente (z.B. `page.format` ist standardmäßig `A4`)

    - mittels `#set <builtin>(<attribute1>: <value1>, ...)` Standardwerte für folgenden Content verändern

    - Scope-gebunden wie Variablendeklarationen

    - nur Builtins: nicht auf nutzer- oder paketdefinierte Funktionen anwendbar
]

#slide[
    #grid(
        columns: (1fr, 1fr),
        column-gutter: 1em,
        row-gutter: 0.5em,

        // text(size: 0.75em)[Typst], text(size: 0.75em)[Output],
        yes-codly(```typ
        #set text(fill: red)
        = Überschrift
        Hallo Welt, dies ist ein Test.

        = Überschrift B
        Wenn eine Maschine denken kann, könnte sie intelligenter denken als wir, und wo sollten wir dann sein?
        ```),
        [
            #set text(fill: red)
            #let hd(body) = block(text(size: 1.25em, weight: "bold", body)) + v(-0.5em)
            #hd[Überschrift]
            Hallo Welt, dies ist ein Test.

            #hd[Überschrift B]
            Wenn eine Maschine denken kann, könnte sie intelligenter denken als wir, und wo sollten wir dann sein?
        ],
    )
]

#slide[
    = show-Regeln:
    - ebenfalls nur für Builtins
    - "`show: y`" heißt "wende Funktion $y$ auf den gesamten folgenden Content im Scope an"
    - "`show x: y`" heißt "wende Funktion $y$ auf jedes Element $x$ an"
    - $y$ kann auch Lambdafunktion sein: `(a1, a2, ..) => { ... }`

    - `.with()` auf Funktionen → funktionale Applikation
]

#slide[
    #set text(size: 0.9em)
    #typst-example(```typ
    #show: underline

    = Überschrift
    Hallo Welt, dies ist ein Test.

    = Überschrift B
    Wenn eine Maschine denken kann, könnte sie intelligenter denken als wir, und wo sollten wir dann sein?
    ```)
]

#slide[
    #set text(size: 0.9em)
    #typst-example(```typ
    #show heading: underline

    = Überschrift
    Hallo Welt, dies ist ein Test.

    = Überschrift B
    Wenn eine Maschine denken kann, könnte sie intelligenter denken als wir, und wo sollten wir dann sein?
    ```)
]

#slide[
    #set text(size: 0.9em)
    #typst-example(```typ
    #show: block.with(
        stroke: 1pt,
        inset: 1em)

    = Überschrift
    Hallo Welt, dies ist ein Test.

    = Überschrift B
    Hier Turing-Zitat von oben.
    ```)
]

#slide[
    = Highly versatile: show-set-Regeln
    #grid(
        columns: (1fr, 1fr),
        column-gutter: 1em,
        row-gutter: 0.5em,

        // text(size: 0.75em)[Typst], text(size: 0.75em)[Output],
        yes-codly(```typ
        #show heading: set text(fill: red)

        = Überschrift
        Hallo Welt, dies ist ein Test.
        = Überschrift B
        Hier Turing-Zitat von oben.
        ```),
        [
            // #set text(fill: red)
            #let hd(body) = block(text(size: 1.25em, fill: red, weight: "bold", body)) + v(-0.5em)
            #hd[Überschrift]
            Hallo Welt, dies ist ein Test.

            #hd[Überschrift B]
            Wenn eine Maschine denken kann, könnte sie intelligenter denken als wir, und wo sollten wir dann sein?
        ],
    )
]

#slide[
    #set text(size: 0.9em)
    #task(time: [10 min.])[
        Bearbeiten Sie in Ordner `Aufgabe 3` das Dokument wie folgt (unter der Verwendung der Typst-Dokumentation):
        + Formatieren Sie das Dokument im Blocksatz (siehe `par`-Funktion).
        + Heben Sie mittels einer show-Regel alle Vorkommen des Wortes "Lorem" fett hervor.
        + Formatieren Sie die Überschriften blau.
        + Formatieren Sie die Nummerierung der Listen wie folgt (siehe `enum`-Funktion):
            #set enum(numbering: "11a.")
            + ...
                + ...
    ]
]

#slide[
    = Typst-Modi: Arten von Inhalten
    - *Content*: Abkürzungen/Syntaxzucker, Text
        #typst-example(```typ
        *Hallo*
        ```)

    - *Script*: Befehle, Steuerwerte, gejointe Rückgabewerte

        #typst-example(```typ
        #(1+1)
        ```)

    - *Math*: mathematische Formeln

        #typst-example(```typ
        $a^2 + b^2 = c^2$
        ```)
]

#slide[
    = Scripting-Modus#footnote[https://typst.app/docs/reference/scripting/]
    #show raw: set text(size: 0.9em)
    #typst-example(```typ
    *Hallo* = #strong[Hallo]

    #let a = [Hey!]
    #a
    #{
        let a = 3
        let b = 4
        a + b
    }
    ```)
]

#slide[
    #show raw: set text(size: 0.9em)
    #typst-example(```typ
    #if 1 - 1 == 0 {
        [Magie]
    }

    #for i in range(0, 10) {
        [#i]
    }

    #let kebab-case(x) = [bar: #x]

    #kebab-case[Meine Funktion!]
    ```)
]

#slide[
    = Mathe-Modus#footnote[https://typst.app/docs/reference/math/]
    - alles ist entweder Variable, Funktion oder Wert
    - anders als in La!TeX: "`a b`" #sym.eq.not "`ab`"

    #[
        #set text(size: 0.825em)
        #typst-example(```typ
        $f(a, b) = a b$
        $ sum_(i=0)^(n-1) 2i + 1 = n^2 $
        ```)
    ]

    - Inline: `$...$`
    - Block: `$ ... $`
]

#slide[
    = Arten von Typst-Inhalten
    #figure[
        #h(-5em)
        #box[
            #set text(size: 0.75em)
            #let node-content-pos = (0, 0)
            #let node-script-pos = (1, -1.75)
            #let node-math-pos = (2, 0)

            #diagram(
                node-stroke: .1em,
                spacing: 3.5em,

                edge((-1.5, 0), "r", "-|>", [Dokument], label-pos: 0, label-side: center),
                node(node-content-pos, [Content], radius: 2em),
                edge(`#...`, "-|>", bend: 5deg),

                node(node-script-pos, [Script], radius: 2em),
                edge(`$...$`, "-|>", bend: 5deg),

                node(node-math-pos, [Math], radius: 2em),
                edge(node-content-pos, node-math-pos, `$...$`, "-|>"),
                edge(node-math-pos, node-script-pos, `#...`, "-|>", bend: 5deg),
                edge(node-script-pos, node-content-pos, `[...]`, "-|>", bend: 5deg),
            )
        ]

        Heilige Trinität der Typst-Modi
    ]
]

#part[
    Große Projekte und Templates
]

#slide[
    = Dateieinbindung: `include` und `import`

    - Content anderer Dateien mit `#include` laden

    - Variablendefinitionen mittels `#import` laden

    #show: columns
    ```typ
    #let a = 1
    #let b = 2

    Hallo Welt!
    ```

    #colbreak()

    #set text(size: 0.9em)
    ```typ
    #import "file.typ": a, b
    ```

    vs.

    ```typ
    #include "file.typ"
    ```
]

#slide[
    = Template-Funktionen

    #set text(size: 0.825em)

    `template.typ`:
    ```typ
    #let project(body) = {
        set text(font: "New Computer Modern")
        body
    }
    ```

    `main.typ:`
    ```typ
    #import "template.typ": project

    #show: project
    ...
    ```
]

#slide[
    = Benannte Parameter
    `template.typ`:
    ```typ
    #let project(
        title: none,
        body
    ) = {
        set text(font: "New Computer Modern")
        align(center, title)
        body
    }
    ```
]

#slide[
    `main.typ`:
    ```typ
    #import "template.typ": project

    #show: project.with(title: [Hier Titel])

    ...
    ```
]

#slide[
    #task[
        Das Programm wirft den folgenden Fehler. Stellen Sie Vermutungen an, woran dies liegen könnte.
    ]

    #set text(size: 0.85em)
    #grid(columns: 2,
        column-gutter: 1em,
        yes-codly(```typ
        #include "template.typ": *

        Dies ist ein Test.
        ```),

        ```
error: expected semicolon or line break
  ┌─ test.typ:1:23
  │
1 │ #include "template.typ": *
  │                        ^
        ```
    )
]

#slide[
    #set text(size: 0.95em)
    #task(time: [10 min.])[
        Im Ordner `Aufgabe 5/` ist ein Typst-Dokument gegeben.
        + Fügen Sie anhand der Kommentare weitere set- und show-Regeln hinzu.

        + Lagern Sie das Page-Setup in eine Datei `template.typ` aus. Die Formatierung des Dokuments soll rein im Template stattfinden, der Inhalt des Dokuments in der Hauptdatei `main.typ`.

        + Wenn Sie es noch nicht getan haben, importieren Sie das Template in der Hauptdatei und wenden Sie es mittels einer show-Regel an.
    ]
]

#slide[
    = Counter, States, Context

    #set text(size: 0.95em)
    #typst-example(code-size: 0.575em, columns: (74%, 1fr), ```typ
    #let arr = (4, 5, 1, 3, 2)
    #let bubble-sort(array) = {
        if array.len() < 2 { return array }

        let i = 0
        while i < array.len() - 1 {
            if array.at(i) > array.at(i + 1) {
                (array.at(i), array.at(i + 1)) = (array.at(i + 1), array.at(i))
                i = 0
            } else { i += 1 }
        }
        return array
    }

    #arr \
    #(arr = bubble-sort(arr))
    #arr
    ```)
]

#slide[
    = Counter, States, Context
    #set text(size: 0.8em)
    #task(title: [Aufgabe 6])[
        Stellen Sie Vermutungen an, was der folgende Code bewirkt!
    ]

    #show: columns
    #yes-codly(```typ
    #let count-up = 0

    #let increment() = {
        count-up = count-up + 1
    }

    #count-up #increment() #count-up
    ```)

    #show: later

    #colbreak()
    ```
error: variables from outside the function are read-only and cannot be modified
  ┌─ test.typ:4:4
  │
4 │     count-up = count-up + 1
  │     ^^^^^^^^

    ```
]

#slide[
    = Counter, States, Context
    - pure functions: keine globalen Variablen, nur "Konstanten"
    - speichern von Zuständen mittels `counter` und `state`
    - Abrufen von kontextabhängigen Werten mittels `context`-Scopes

    #typst-example(```typ
    #let a = counter("a")

    #context a.display()
    #a.step()
    #a.step()
    #context a.display()
    ```)
]

#slide[
    = Counter, States, Context
    #set text(size: 0.8em)
    - States als allgemeine Zustandsspeicher:

    #typst-example(```typ
    #let a = state("a", ())

    #context a.get()
    #a.update(k => {
        k.push(1)
        k
    })
    #context a.get()
    ```)
    - `context`-Scopes geben immer kontextbasierten Content zurück → keine Möglichkeit Werte aus `context` zu erhalten (da inkrementelle Kompilierung)
]

#slide[
    = Praxisbeispiel: Aufgabenelement

    #typst-example(columns: (60%, 40%), code-size: 0.8em, ```typ
    #let task(body) = {
        show: block.with(
            fill: gray.lighten(75%))
        body
    }

    #task[Dies ist eine Aufgabe! Tun Sie dies, machen Sie das.]
    ```)
]

#slide[
    = Praxisbeispiel: Aufgabenelement

    #typst-example(columns: (60%, 40%), code-size: 0.7em, ```typ
    #let task(body) = {
        show: block.with(
            fill: gray.lighten(75%),
            inset: 0.5em)
        body
    }

    #task[Dies ist eine Aufgabe! Tun Sie dies, machen Sie das.]
    ```)
]

#slide[
    = Praxisbeispiel: Aufgabenelement

    #typst-example(columns: (60%, 40%), code-size: 0.6em, ```typ
    #let task(body) = {
        show: block.with(
            fill: gray.lighten(75%),
            inset: 0.5em)

        strong[Aufgabe #context counter("tc").display(): ]
        body
    }

    #task[Dies ist eine Aufgabe! Tun Sie dies, machen Sie das.]
    ```)
]

#slide[
    = Praxisbeispiel: Aufgabenelement

    #typst-example(columns: (60%, 40%), code-size: 0.6em, ```typ
    #let task(body) = {
        show: block.with(
            fill: gray.lighten(75%),
            inset: 0.5em)

        counter("tc").step()

        strong[Aufgabe #context counter("tc").display(): ]
        body
    }
    #task[#lorem(10)]
    #task[#lorem(10)]
    ```)
]

#part[
    Typst als Universum
]

#slide[
    = Typst Universe
    - quasi CTAN: Repository an Paketen und Templates

    #image("img/universe.png")
]

#slide[
    = Paket-Highlights -- CeTZ
    https://typst.app/universe/package/cetz

    #grid(
        columns: 3,
        align: center,
        grid.cell(rowspan: 2, image("img/universe/cetz_capacitor.png", height: 70%)),
        image("img/universe/cetz_pacioli.png", height: 40%),
        grid.cell(rowspan: 2, image("img/universe/cetz_karls.png", height: 70%)),
        image("img/universe/cetz_waves.png", height: 30%),
    )
]

#slide[
    = Paket-Highlights -- CeTZ

    #import "Beispiele/petrinetze-library.typ": *

    #show math.equation: set text(size: 0.4em)
    #set align(horizon + center)
    #stack(dir: ltr,
        spacing: 1em,
        image(height: 70%, "img/petrinetze/petrinetz-1.png"),
        [#sym.arrow],
        load-petrinet-xml(scale: 2, xml("Beispiele/petrinetz-1.xml")))
]

#slide[
    = Paket-Highlights -- Fletcher
    https://typst.app/universe/package/fletcher

    #grid(
        columns: 2,
        align: center,
        image("img/universe/fletcher_flowchart.svg", height: 60%),
        image("img/universe/fletcher_nodegroups.svg", height: 65%),
    )
]

#slide[
    = Paket-Highlights -- Lilaq
    https://typst.app/universe/package/lilaq

    #grid(
        columns: 2,
        align: center,
        image("img/universe/lilaq_box.svg", height: 35%),
        grid.cell(rowspan: 2, image("img/universe/lilaq_spectrum.svg", width: 90%)),
        image("img/universe/lilaq_weather.svg", height: 35%),
    )
]

#show image: block.with(stroke: 1pt)
#show image: set align(center)
#slide[
    = Template-Highlights -- Charged IEEE

    #image("img/universe/charged-ieee.png", height: 1fr)
]

#slide[
    = Template-Highlights -- Unequivocal AMS
    #image("img/universe/unequivocal-ams.png", height: 1fr)
]

#part[
    Typst in der Praxis?
]

#slide[
    = Was noch kommt
    + #strike[HTML-Output] (seit v0.13.0 experimentell vorhanden)

    + nutzerdefinierte Elemente (mit show- und set-Regeln)

    + Type Hinting
]

#slide[
    = Fazit

    Fassen Sie kurz zusammen, wie Sie den Workshop wahrgenommen haben, z. B.:
    - was Sie am interessantesten fanden,
    - welche offenen Fragen Sie haben,
    - wie sinnvoll Sie den Einsatz von Typst im Studienalltag sehen.
]


#slide[
    = Kleines Fazit meinerseits
    *Meine Hürde:*
    - nicht Turing-vollständig (Oh `state` und `context` ...)

    *Meine Pros:*
    // #item-by-item[
    - Ich will kein La!TeX-Mathe mehr schreiben
    - Live-Preview ist echt nice
    - Layouting in Typst ist ziemlich einfach und gut strukturiert
    - Pakete sind ungeheuer mächtig
    - Schnelligkeit
    - Unicode!
    // ]
]

#slide[
    *Meine Cons:*
    // #item-by-item[
    - Publizieren in Typst? → (noch) unmöglich
    - Pakete von GitHub oder aus privaten Quellen? Schwierig
    - Pakete mangeln teilw. an Qualität und Reife → nicht die Zeit für Reife wie bei LaTeX
    - die Doku hat kein gutes Tutorial (Website-Rework in Arbeit)
    - "layout did not converge" → Debugging(?)
    - #strike[(solange kein HTML-Export) veraltetes Veröffentlichungsmodell: PDF]
    // ]
]


