#let (t, p, e, petrinet, load-petrinet-xml) = {
    import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
    import "@preview/cetz:0.5.0"

    // let p(name: none, tokens: 0, scale: 1, limit: -1, ..a) = node(
    //     radius: 0.15cm * scale,
    //     shape: fletcher.shapes.circle,
    //     ..a,
    // )
    //
    // let t(name: none, tokens: 0, scale: 1, limit: -1, ..a) = node(
    //     corner-radius: 0pt,
    //     shape: fletcher.shapes.rect,
    //     width: 0.1cm * scale,
    //     height: 0.3cm * scale,
    //     fill: black,
    //     ..a,
    // )
    //
    // let e(..a) = edge(..a, "-|>")
    //
    // let petrinet = diagram.with(spacing: 1em, node-stroke: 1pt)

    let p(pos, anchor: none, label: "<NOLABEL>", tokens: 0, limit: -1, ..a) = {
        (
            type: "place",
            x: pos.first(),
            y: pos.last(),

            label: if label == "<NOLABEL>" and anchor == none {
                none
            } else if label == "<NOLABEL>" and anchor != none {
                anchor.at(0) + if anchor.len() > 1 { "_" + anchor.at(1) }
            } else {
                label
            }, // visible

            tokens: tokens,
            limit: limit,
            anchor: anchor, // invisible
        )
    }

    let t(pos, label: "<NOLABEL>", anchor: none, limit: -1, ..a) = {
        (
            type: "transition",
            x: pos.first(),
            y: pos.last(),
            label: if label == "<NOLABEL>" and anchor == none {
                none
            } else if label == "<NOLABEL>" and anchor != none {
                anchor.at(0) + if anchor.len() > 1 { "_" + anchor.at(1) }
            } else {
                label
            }, // visible, // visible
            anchor: anchor, // invisible
        )
    }

    let e(
        source,
        destination,
        breakpoints: (),
        multiplicity: 1,
        etype: "regular",
        sourceId: none,
        destinationId: none,
        label: none,
        anchor: none,
        ..a,
    ) = {
        (
            type: "edge",
            etype: etype,
            source: source,
            destination: destination,
            label: label, // visible
            multiplicity: multiplicity,
            breakpoints: breakpoints,
            destinationId: destinationId,
            sourceId: sourceId,
            anchor: anchor, // invisible
        )
    }

    let _cetz-place-label(object, edges, label, font-size: 7pt) = {
        import cetz.draw: *

        let pos = (object.x, object.y)

        // --- calculate biggest interval between neighboring edges ---
        // calculate alpha first for each edge
        let incoming-edges = edges // incoming edges have their destination in p
            .filter(e => e.destination == pos)
            .map(e => (pos, (e.source, ..e.breakpoints).last()))

        let outgoing-edges = edges // outgoing edges have their source in p
            .filter(e => e.source.first() == object.x and e.source.last() == object.y)
            .map(e => (pos, (..e.breakpoints, e.destination).first()))

        let debug-pivot = "s_x"

        if object.anchor == debug-pivot {
            // panic(incoming-edges, "outgoing", outgoing-edges)
        }

        // calculate alpha for each edge, sort them, calculate the interval between neighboring alphas
        let alphas = (incoming-edges + outgoing-edges)
            .map(e => {
                let ((x1, y1), (x2, y2)) = e
                calc.atan2(x2 - x1, y2 - y1)
            })
            .map(e => if e < 0deg { e + 360deg } else { e })
            .sorted()

        if object.anchor == debug-pivot {
            // panic((object.anchor, alphas))
        }

        // 2d-array of ((interval-size, start-alpha), (interval-size, start-alpha), ...)
        let intervals = alphas
            .enumerate()
            .map(((index, e)) => if alphas.len() > 1 { (alphas.at(calc.rem(index + 1, alphas.len())) - e, e) } else {
                (360deg, e)
            })
            .map(((e, start)) => (if e <= 0deg { e + 360deg } else { e }, start))

        if object.anchor == debug-pivot {
            // panic((object.anchor, intervals))
        }

        // get biggest interval element
        let biggest-alpha-pos = intervals.position(e => (
            e.first() == intervals.sorted(key: e => e.first()).last().first()
        ))

        if object.anchor == debug-pivot {
            // panic(intervals.at(biggest-alpha-pos))
        }

        let alpha = if biggest-alpha-pos == none { 0deg } else {
            let interval = intervals.at(biggest-alpha-pos)
            interval.last() + interval.first() / 2
        }

        while alpha > 360deg {
            alpha -= 360deg
        }

        let padding = font-size * 1.25

        if object.anchor == debug-pivot {
            // panic((object.anchor, alpha))
        }

        content(
            (name: object.anchor, anchor: alpha),
            if type(object.label) == str { eval(object.label, mode: "math") } else { object.label },
            padding: (
                left: if alpha >= 270deg or alpha < 90deg { padding } else { 0 },
                bottom: if alpha >= 45deg and alpha < 135deg { padding } else { 0 },
                right: if alpha >= 135deg and alpha < 225deg { padding } else { 0 },
                top: if alpha >= 225deg and alpha < 315deg { padding } else { 0 },
            ),
        )
    }

    let _translate-p-to-cetz(p, edges) = {
        import cetz.draw: *

        circle((p.x, p.y), radius: 20, name: p.anchor)

        if p.anchor != none {
            _cetz-place-label(p, edges, p.label)
        }

        let draw-dotcircle(sections) = {
            let sections = int(sections) - 1

            let circle-radius = 10
            let dots-radius = (2 * calc.pi * circle-radius / sections) / 4.5

            for i in range(sections) {
                let x = calc.cos(i * 2 * calc.pi / sections) * circle-radius
                let y = calc.sin(i * 2 * calc.pi / sections) * circle-radius

                circle((p.x + x, p.y + y), radius: dots-radius, fill: black)
            }

            circle((p.x, p.y), radius: dots-radius, fill: black)
        }

        if p.tokens == 1 {
            circle((p.x, p.y), radius: 5, fill: black)
        } else if p.tokens == 2 {
            circle((p.x + 8, p.y), radius: 5, fill: black)
            circle((p.x - 8, p.y), radius: 5, fill: black)
        } else if p.tokens == 3 {
            circle((p.x + 8, p.y), radius: 5, fill: black)
            circle((p.x - 5, p.y + 8), radius: 5, fill: black)
            circle((p.x - 5, p.y - 8), radius: 5, fill: black)
        } else if p.tokens == 4 {
            circle((p.x + 7, p.y - 7), radius: 4, fill: black)
            circle((p.x + 7, p.y + 7), radius: 4, fill: black)
            circle((p.x - 7, p.y - 7), radius: 4, fill: black)
            circle((p.x - 7, p.y + 7), radius: 4, fill: black)
        } else if p.tokens == 5 {
            circle((p.x + 8, p.y - 8), radius: 3, fill: black)
            circle((p.x + 8, p.y + 8), radius: 3, fill: black)
            circle((p.x - 8, p.y - 8), radius: 3, fill: black)
            circle((p.x - 8, p.y + 8), radius: 3, fill: black)
            circle((p.x, p.y), radius: 3, fill: black)
        } else if p.tokens >= 6 and p.tokens <= 9 {
            draw-dotcircle(p.tokens)
        } else if p.tokens > 0 {
            content((p.x, p.y), [#p.tokens])
        }
    }

    let _translate-t-to-cetz(t, edges) = {
        import cetz.draw: *

        rect((t.x - 5, t.y - 15), (t.x + 5, t.y + 15), fill: black, name: t.anchor)
        _cetz-place-label(t, edges, t.label)
    }

    let _translate-e-to-cetz(e) = {
        import cetz.draw: *

        let directions = (
            if e.sourceId != none { e.sourceId } else { e.source },
            ..e.breakpoints,
            if e.destinationId != none { e.destinationId } else { e.destination },
        )

        line(
            ..directions,
            mark: (
                end: (
                    "regular": ">",
                    "reset": ((symbol: ">", sep: 0cm, length: 0.125), (symbol: ">", sep: 0cm, length: 0.125)),
                    "inhibitor": (symbol: "o", scale: 0.75),
                    "read": "o",
                ).at(e.etype, default: ">"),
                fill: ("inhibitor": none).at(e.etype, default: black),
                scale: 0.5,
            ),
            name: e.anchor,
        )

        let directions = (e.source, ..e.breakpoints, e.destination).slice(0, 2)
        let ((x1, y1), (x2, y2)) = directions
        let alpha = calc.atan2(x2 - x1, y2 - y1)

        if alpha < 0deg {
            alpha += 360deg
        }

        alpha /= 360deg
        alpha = int(calc.round(alpha * 8))

        if e.multiplicity != 1 {
            if e.anchor == none {
                panic("edge's anchor has to set for multiplicity > 0")
            }

            content(
                (name: e.anchor, anchor: 40%),
                anchor: (
                    "north",
                    "north-west",
                    "west",
                    "south-west",
                    "north",
                    "south-east",
                    "east",
                    "north-east",
                    "north",
                ).at(alpha),
                padding: 0.05,
                if e.multiplicity != 1 [
                    #set text(size: 0.6em)
                    $#e.multiplicity$
                ],
            )
        }
    }

    let petrinet(scale-factor: 1, payload: {}, ..elements) = {
        set text(size: scale-factor * 7pt)

        cetz.canvas({
            import cetz.draw: *

            scale(0.01 * scale-factor)

            let elements = elements.pos()

            let min-x = elements.filter(e => e.type in ("place", "transition")).map(e => e.x).sorted().first(default: 0)
            let min-y = elements.filter(e => e.type in ("place", "transition")).map(e => e.y).sorted().first(default: 0)

            let edges = elements
                .filter(e => e.type == "edge")
                .map(e => {
                    if type(e.source) == str {
                        e.sourceId = e.source
                        e.source = elements.filter(i => i.anchor == e.source).first()
                        e.source = (e.source.x, e.source.y)
                    }

                    if type(e.destination) == str {
                        e.destinationId = e.destination
                        e.destination = elements.filter(i => i.anchor == e.destination).first()
                        e.destination = (e.destination.x, e.destination.y)
                    }

                    e.source.first() -= min-x
                    e.source.last() -= min-y
                    e.source.last() *= -1

                    e.destination.first() -= min-x
                    e.destination.last() -= min-y
                    e.destination.last() *= -1

                    for i in range(e.breakpoints.len()) {
                        e.breakpoints.at(i).first() -= min-x
                        e.breakpoints.at(i).last() -= min-y
                        e.breakpoints.at(i).last() *= -1
                    }

                    e
                })

            let transitions = elements
                .filter(e => e.type == "transition")
                .map(e => {
                    // minimize x and y, so the smallest position is (0, 0)
                    e.x -= min-x
                    e.y -= min-y

                    // invert y because of cetz
                    e.y *= -1


                    e
                })

            let places = elements
                .filter(e => e.type == "place")
                .map(e => {
                    // minimize x and y, so the smallest position is (0, 0)
                    e.x -= min-x
                    e.y -= min-y

                    // invert y because of cetz
                    e.y *= -1

                    e
                })


            for e in transitions {
                _translate-t-to-cetz(e, edges)
            }

            for e in places {
                _translate-p-to-cetz(e, edges)
            }

            for e in edges {
                _translate-e-to-cetz(e)
            }

            payload
        })
    }


    let _xml-get-child(data, tag) = {
        data.children.filter(e => e.tag == tag).first(default: (children: (none,))).children
    }

    let _xml-get-children(data, tag) = {
        data.children.filter(e => e.tag == tag)
    }

    let t-from-xml(node) = {
        let x = int(_xml-get-child(node, "x").first())
        let y = int(_xml-get-child(node, "y").first())
        let id = _xml-get-child(node, "id").first()
        let label = _xml-get-child(node, "label").first(default: none)

        (x: x, y: y, id: id, anchor: id, label: label)
    }

    let p-from-xml(node) = {
        let x = int(_xml-get-child(node, "x").first())
        let y = int(_xml-get-child(node, "y").first())
        let id = _xml-get-child(node, "id").first()
        let label = _xml-get-child(node, "label").first(default: none)
        let tokens = float(_xml-get-child(node, "tokens").first())
        let static = _xml-get-child(node, "static").first() == "true"

        (id: id, x: x, y: y, label: label, anchor: id, tokens: tokens, static: static)
    }

    let e-from-xml(node) = {
        let id = _xml-get-child(node, "id").first()
        let multiplicity = float(_xml-get-child(node, "multiplicity").first())

        let source = _xml-get-child(node, "sourceId").first()
        let destination = _xml-get-child(node, "destinationId").first()
        let breakpoints = _xml-get-children(node, "breakpoint").map(e => (
            x: int(_xml-get-child(e, "x").first()),
            y: int(_xml-get-child(e, "y").first()),
        ))

        let type = _xml-get-child(node, "type").first(default: "regular")

        (
            id: id,
            source: source,
            anchor: id,
            etype: type,
            destination: destination,
            multiplicity: multiplicity,
            breakpoints: breakpoints,
        )
    }

    let _clean-xml(data) = {
        if type(data) != dictionary {
            return data
        }

        data.children = data.children.filter(e => if type(e) == str and e.trim().len() == 0 { false } else { true })
        data.children = data.children.map(e => _clean-xml(e))

        data
    }

    let load-petrinet-xml(source, padding: 1em, payload: {}, scale: 1) = {
        show: pad.with(padding)
        set text(size: 0.25cm * scale)

        let data = source
        let document = _clean-xml(source.at(0))

        let transitions = ()
        let places = ()
        let arcs = ()

        for child in document.children {
            if type(child) != dictionary {
                continue
            }

            if "tag" not in child or child.tag not in ("transition", "place", "arc") {
                continue
            }

            if child.tag == "place" {
                places.push(p-from-xml(child))
            } else if child.tag == "arc" {
                arcs.push(e-from-xml(child))
            } else if child.tag == "transition" {
                transitions.push(t-from-xml(child))
            }
        }

        let vertices = places + transitions

        let transitions = transitions.map(e => {
            t((e.x, e.y), ..e)
        })

        let places = places.map(e => {
            p((e.x, e.y), ..e)
        })

        let arcs = arcs.map(a => {
            let from = vertices.filter(f => f.id == a.source).first()
            let to = vertices.filter(f => f.id == a.destination).first()
            let breakpoints = a.breakpoints.map(f => (f.x, f.y))

            e(
                (from.x, from.y),
                (to.x, to.y),
                etype: a.etype,
                anchor: a.anchor,
                sourceId: a.source,
                destinationId: a.destination,
                breakpoints: breakpoints,
                multiplicity: a.multiplicity,
                if a.multiplicity != 1 { a.multiplicity },
            )
        })

        petrinet(scale-factor: scale, spacing: 0.05mm * scale, payload: payload, ..transitions, ..places, ..arcs)
    }

    (t, p, e, petrinet, load-petrinet-xml)
}
