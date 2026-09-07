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

  set-style(stroke: 0.3pt + tx)

  let length = 12
  let width = 6
  let thickness = 0.8
  let padlength = 2
  let dirlen = 1.3
  let inset = 0.2
  let cap_thickness = 0.8

  ortho(sorted: false, {
    on-xz({
      rect(
        (0, 0),
        (length, width),
      )
      rect(
        (0, 0),
        (padlength, width),
        fill: ylw,
      )
      rect(
        (length, width),
        (length - padlength, 0),
        fill: ylw,
      )
      rect(
        (padlength, 0),
        (length - padlength, width),
        fill: ui,
      )

      rect(
        (length - padlength - dirlen, 0),
        (length - padlength, width),
        fill: green,
      )
    })

    on-xz(y: -thickness, {
      rect(
        (-2 * inset, 1 * width + inset),
        (-7 * inset + width, 2 * width + inset),
        fill: ui,
        stroke: tx + 1pt,
      )
      rect(
        (-23 * inset + length, 1 * width + inset),
        (-28 * inset + width + length, 2 * width + inset),
        fill: ui,
        stroke: tx + 1pt,
      )

      line(
        (-33 * inset + length, 1 * width + inset),
        (-24 * inset + length, 1 * width + inset),

        (-24 * inset + length, 2 * width + inset),
        (-33 * inset + length, 2 * width + inset),
        stroke: 3pt + ui,
      )
    })

    line(
      (0, 0, width),
      (0, -thickness, width),
      (length, -thickness, width),
      (length, -thickness, 0),
      (length, 0, 0),
    )

    on-xy(z: width, {
      rect((0, 0), (padlength, -thickness), fill: ylw)
      rect((length - padlength, 0), (length, -thickness), fill: ylw)

      rect(
        (padlength, -thickness),
        ((length - padlength - dirlen), 0),
        fill: ui,
      )
      rect(
        ((length - padlength - dirlen), 0),
        (length - padlength, -thickness),
        fill: green,
      )
    })

    on-zy(x: length, {
      rect((0, 0), (width, -thickness), fill: ylw)
    })

    on-zy(
      x: (length - padlength - dirlen - inset),
      {
        rect((0 + inset, 0), (width - inset, cap_thickness), fill: cyan)
      },
    )

    on-xz(
      y: cap_thickness,
      {
        rect(
          (padlength + inset, inset),
          (length - padlength - dirlen - inset, width - inset),
          fill: cyan,
        )

        circle(
          ((padlength + inset + (length - padlength - dirlen - inset)) / 2, width / 2),
          stroke: 1pt + ui,
          fill: ui,
        )
      },
    )

    on-xy(z: width - inset, {
      rect(
        (padlength + inset, 0),
        (length - padlength - dirlen - inset, cap_thickness),
        fill: cyan,
      )
    })
  })
})
