#import "@preview/cetz:0.5.2": canvas, draw

#set text(font: "Ioskeley Mono", size: 11pt)

#set table(
  fill: (x, y) => if calc.even(y) and y > 1 { gray.lighten(50%) },
  align: (x, y) => if x == 0 { left } else { center },
  inset: (right: 1.5em),
)

#title[Project One SMD Components]

== Resistors:
#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  table.header(
    table.cell(fill: gray.lighten(30%))[*Designators*],
    table.cell(fill: gray.lighten(30%))[*Value*],
    table.cell(fill: gray.lighten(30%))[*Quantity*],
    table.cell(fill: gray.lighten(30%))[*Code*],
  ),

  [R1], [22R], [1], [22],
  [R2 R3 R4 R5], [330R], [4], [331],
  [R6], [120R], [1], [121],
)

== Capacitors:
#table(
  columns: (2fr, 1fr, 1fr),
  table.header(
    table.cell(fill: gray.lighten(30%))[*Designators*],
    table.cell(fill: gray.lighten(30%))[*Value*],
    table.cell(fill: gray.lighten(30%))[*Quantity*],
  ),
  [C1 C2], [0.1uF], [2],
  [C3], [4.7uF], [1],
)

== LEDs

#table(
  columns: (2fr, 1fr, 1fr),
  table.header(
    table.cell(fill: gray.lighten(30%))[*Designators*],
    table.cell(fill: gray.lighten(30%))[*Value*],
    table.cell(fill: gray.lighten(30%))[*Quantity*],
  ),
  [D1 D2 D3], [BLUE], [3],
)

// #canvas({
//   import draw: *
//
//   rect(
//     (0,0),
//     (2,2),
//     fill: gray
//   )
//
//   rect(
//     (0,4),
//     (2,6),
//     fill: gray
//   )
//
//   set-style(stroke: 2pt)
//
//   line(
//     (2,3.5),
//     (0,3.5),
//   )
//
//   line(
//     (2,3),
//     (2,3.5),
//   )
//   line(
//     (0,3),
//     (0,3.5),
//   )
//
//   set-style(stroke: 1pt)
//
// })


