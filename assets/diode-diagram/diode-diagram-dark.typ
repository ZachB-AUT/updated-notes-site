#import "@preview/cetz:0.5.2": canvas, draw;

#let tx = rgb(206, 205, 195)
#let tx2 = rgb(135, 133, 128)
#let bg = rgb(16, 15, 15)
#let ui = rgb(40, 39, 38)
#let green = rgb(135, 154, 57)
#let ylw = rgb(208, 162, 21)
#let blue = rgb(67, 133, 190)
#let cyan = rgb(58, 169, 159)

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
  set-style(stroke: tx)

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

  set-style(stroke: tx)
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

#pagebreak()

#let led-1206-top = canvas({
  import draw: *

  set-style(stroke: (paint: black, thickness: 0.5pt))

  // 1 drawing unit = 1 mm, rendered at 0.5 cm per mm
  scale(0.5)

  let L = 3.2 // package length
  let W = 1.6 // package width
  let T = 0.5 // termination band width
  let m = 0.22 // cathode mark width

  let thin = (paint: gray, thickness: 0.4pt)
  let arrow = (start: "straight", end: "straight", scale: 0.5)

  // ---------- package body ----------
  rect((-L / 2, -W / 2), (L / 2, W / 2), radius: 0.1, fill: tx)

  // ---------- end terminations ----------
  rect((-L / 2, -W / 2), (-L / 2 + T, W / 2), fill: tx2)
  rect((L / 2 - T, -W / 2), (L / 2, W / 2), fill: tx2)

  // ---------- cathode mark ----------
  rect((L / 2 - T - m, -W / 2), (L / 2 - T, W / 2), fill: green, stroke: none)

  // ---------- emitting window / encapsulant ----------
  rect((-0.85, -0.55), (0.85, 0.55), radius: 0.2, fill: rgb("#ffd98a"), stroke: (
    paint: rgb("#b8860b"),
    thickness: 0.5pt,
  ))

  // ---------- die and bond wire ----------
  rect((-0.30, -0.26), (0.30, 0.26), fill: rgb("#e8a020"), stroke: (thickness: 0.4pt))
  bezier((0.30, 0.12), (0.80, 0.34), (0.58, 0.46), stroke: (paint: rgb("#6f6f6f"), thickness: 0.6pt))
  circle((0.30, 0.12), radius: 0.07, fill: rgb("#6f6f6f"), stroke: none)

  // ---------- terminal labels (inside the metallisation) ----------
  content((-L / 2 + T / 2, 0), text(8pt)[A])
  content((L / 2 - T / 2, 0), text(8pt)[K])

  // ---------- 0.5 mm termination width (top left) ----------
  let ty = W / 2 + 0.75
  line((-L / 2, W / 2 + 0.05), (-L / 2, ty + 0.15), stroke: thin)
  line((-L / 2 + T, W / 2 + 0.05), (-L / 2 + T, ty + 0.15), stroke: thin)
  line((-L / 2 - 0.55, ty), (-L / 2 + T + 0.55, ty), mark: arrow)
  content((-L / 2 + T / 2, ty + 0.15), text(8pt)[0.5 mm], anchor: "south")

  // ---------- cathode mark callout (top right) ----------
  let cx = L / 2 - T - m / 2
  line((cx, W / 2 + 0.05), (cx, ty), (L / 2 + 0.55, ty), stroke: thin)
  content((L / 2 + 0.65, ty), text(8pt)[cathode mark], anchor: "west")

  // ---------- polarity symbol ----------
  let py = -W / 2 - 0.6
  line((-0.35, py + 0.22), (-0.35, py - 0.22), (0.05, py), close: true, fill: black, stroke: none)
  line((0.05, py + 0.24), (0.05, py - 0.24), stroke: (thickness: 1pt))
  line((-0.85, py), (-0.35, py))
  line((0.05, py), (0.55, py))

  // ---------- overall length ----------
  let ly = -W / 2 - 1.45
  line((-L / 2, -W / 2 - 0.05), (-L / 2, ly - 0.15), stroke: thin)
  line((L / 2, -W / 2 - 0.05), (L / 2, ly - 0.15), stroke: thin)
  line((-L / 2, ly), (L / 2, ly), mark: arrow)
  content((0, ly - 0.12), text(8pt)[3.2 mm], anchor: "north")

  // ---------- overall width ----------
  let wx = L / 2 + 1.15
  line((L / 2 + 0.05, -W / 2), (wx + 0.15, -W / 2), stroke: thin)
  line((L / 2 + 0.05, W / 2), (wx + 0.15, W / 2), stroke: thin)
  line((wx, -W / 2), (wx, W / 2), mark: arrow)
  content((wx + 0.12, 0), text(8pt)[1.6 mm], anchor: "west")
})

#led-1206-top

