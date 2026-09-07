#import "@preview/cetz:0.5.2": canvas, draw;

#let tx = rgb(16, 15, 15)
#let bg = rgb(255, 252, 240)
#let ui = rgb(230, 228, 217)
#let green = rgb(102, 128, 11)
#let ylw = rgb(173, 131, 1)
#let blue = rgb(32, 94, 166)
#let cyan = rgb(36, 131, 123)

#set text(
  font: "Ioskeley Mono",
  fill: tx,
)

#set page(
  width: auto,
  height: auto,
  fill: bg,
  margin: 1em,
)

#canvas({
  import draw: *

  set-style(stroke: tx)

  // Top pad
  rect(
    (0, 0),
    (4, 4),
    fill: ui,
  )

  // Bottom pad
  rect(
    (0, 6),
    (4, 10),
    fill: ui,
  )

  // Direction Indicator
  // line((4, 5.5), (0, 5.5),  stroke: tx)
  // line((0, 5.5), (0, 5), stroke: tx)
  // line((4, 5.5), (4, 5), stroke: tx)

  line(
    (0, 5),
    (0, 5.5),
    (4, 5.5),
    (4, 5),
    stroke: 2pt + tx,
  )

  line(
    (5, 1),
    (5, 8),
    stroke: 5pt + tx,
    mark: (end: ">"),
    name: "Arrow",
  )

  content(
    ("Arrow.start", 50%, "Arrow.end"),
    [Diode faces\
      this way!],
    anchor: "west",
    padding: 1em,
  )
})

#pagebreak()

#canvas({
  import draw: *

  line((0, 0), (0, 8))
  line((4, 0), (4, 8))

  arc(
    (3, 0),
    start: 0deg,
    stop: 180deg,
  )

  arc(
    (1, 8),
    start: -180deg,
    stop: 0deg,
    radius: 1,
  )

  line((0, 0), (1, 0))
  line((3, 0), (4, 0))

  line((3, 8), (4, 8))
  line((0, 8), (1, 8))

  rect(
    (0.1, 2),
    (3.9, 6),
    fill: cyan,
  )

  rect(
    (3.9, 6),
    (2.8, 6.6),
    fill: green,
  )
  line(
    (-1, 1),
    (-1, 7),
    mark: (end: ">"),
    stroke: 3pt + tx,
    name: "arrow",
  )

  content(
    ("arrow.start", 50%, "arrow.end"),
    [Diode faces\ this way],
    anchor: "east",
    padding: 1em,
  )
})

#pagebreak()

#canvas({
  import draw: *

  line((0, 0), (0, 7))
  line((4, 0), (4, 7))

  rect(
    (0, 0),
    (4, 8),
    fill: ui,
  )

  rect((0, 0), (4, 1), fill: ylw)
  rect((0, 7), (4, 8), fill: ylw)

  rect((0, 5), (1, 6), fill: green)
  rect((4, 5), (3, 6), fill: green)
  line((4.5, 5.5), (6, 5.5), mark: (start: ">"))
  content((), [Direction\ Indicator], anchor: "west", padding: 1em)

  rect((0, 2), (4, 5), fill: cyan)

  line(
    (-1, 1),
    (-1, 7),
    mark: (end: ">"),
    stroke: 3pt + tx,
    name: "arrow",
  )

  content(
    ("arrow.start", 50%, "arrow.end"),
    [Diode faces\ this way],
    anchor: "east",
    padding: 1em,
  )
})


