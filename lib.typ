#import "@preview/showybox:2.0.3": showybox

#let box-colors = (
  default: (stroke: luma(70), fill: white, title: white),
  red: (stroke: rgb(237, 32, 84), fill: rgb(253, 228, 224), title: white),
  green: (stroke: rgb(102, 174, 62), fill: rgb(235, 244, 222), title: white),
  blue: (stroke: rgb(29, 144, 208), fill: rgb(232, 246, 253), title: white),
)

#let colorbox(
  title: none,
  box-colors: box-colors,
  color: "default",
  radius: 2pt,
  inset: 8pt,
  stroke: 2pt,
  width: auto,
  body,
) = {
  if title != none {
    return showybox(
      title: title,
      frame: (
        title-color: box-colors.at(color).stroke,
        body-color: box-colors.at(color).fill,
        border-color: box-colors.at(color).stroke,
        radius: radius,
        thickness: stroke,
        body-inset: (top: inset + 4pt, rest: inset),
      ),
      title-style: (
        color: box-colors.at(color).title,
        weight: "bold",
        boxed-style: (
          anchor: (
            x: left,
            y: top,
          ),
          offset: (
            x: -1em,
          ),
          radius: (radius),
        ),
      ),
      body-style: (
        align: left,
        color: black,
      ),
      width: width,
    )[
      #body
    ]
  } else {
    return showybox(
      frame: (
        title-color: box-colors.at(color).stroke,
        body-color: box-colors.at(color).fill,
        border-color: box-colors.at(color).stroke,
        radius: radius,
        thickness: stroke,
        body-inset: inset,
      ),
      title-style: (
        color: box-colors.at(color).title,
        weight: "bold",
        boxed-style: (
          anchor: (
            x: left,
            y: top,
          ),
          offset: (
            x: -1em,
          ),
          radius: (radius),
        ),
      ),
      body-style: (
        align: left,
        color: black,
      ),
      width: width,
    )[
      #body
    ]
  }
}

#let slanted-colorbox(
  title: "Title",
  color: "default",
  radius: 2pt,
  stroke: 2pt,
  inset: 8pt,
  width: auto,
  body,
) = {
  showybox(
    frame: (
      body-color: box-colors.at(color).fill,
      border-color: box-colors.at(color).stroke,
      radius: radius,
      thickness: stroke,
      body-inset: 0pt,
    ),
    width: width,
  )[
    #context {
      let size = measure(title)
      let inset = 8pt
      polygon(
        fill: box-colors.at(color).stroke,
        (0pt, 0pt),
        (0pt, size.height + (2 * inset)),
        (size.width * 1.11 + (2 * inset), size.height + (2 * inset)),
        (size.width * 1.11 + (2 * inset) + 6pt, 0cm),
      )
    }
    #place(left + top, dx: 10pt, dy: 7pt)[
      #text(fill: white, weight: "bold")[#title]
    ]
    #block(inset: (top: inset - 10pt, rest: inset))[
      #body
    ]
  ]
}


#let outline-colorbox(
  title: "Title",
  color: "default",
  width: 100%,
  radius: 2pt,
  stroke: 2pt,
  inset: 8pt,
  centering: false,
  body,
) = {
  return showybox(
    title: text(fill: white, weight: "bold")[#title],
    frame: (
      title-color: box-colors.at(color).stroke,
      body-color: box-colors.at(color).fill,
      border-color: box-colors.at(color).stroke,
      radius: radius,
      thickness: stroke,
      body-inset: inset,
    ),
    title-style: (
      color: white,
      weight: "bold",
      boxed-style: (
        anchor: (
          x: if centering { center } else { left },
          y: horizon,
        ),
        offset: (
          x: if centering { 0em } else { 1em },
        ),
        radius: (radius),
      ),
    ),
    width: width,
  )[
    #body
  ]
}

#let stickybox(rotation: 0deg, width: 100%, body) = {
  let stickyYellow = rgb(255, 240, 172)

  return rotate(rotation)[
    #let shadow = 100%
    #if width != 100% {
      shadow = width
    }
    #place(
      bottom + center,
      dy: if type(width) == ratio { 0.2 * shadow } else { 0.05 * shadow },
    )[
      #image("background.svg", width: shadow - 3mm)
    ]
    #block(
      fill: stickyYellow,
      width: width,
    )[
      #place(
        top + center,
        dy: -2mm,
      )[
        #image(
          "tape.svg",
          width: if type(width) == ratio { calc.clamp(width * 0.35cm / 1cm, 1, 4) * 1cm } else {
            calc.clamp(width * 0.35 / 1cm, 1, 4) * 1cm
          },
          height: 4mm,
        )
      ]
      #block(width: 100%, inset: (top: 12pt, x: 8pt, bottom: 8pt))[
        #body
      ]
    ]
  ]
}