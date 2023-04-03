#let colorbox(title: "title", color: none, radius: 2pt, width: auto, body) = {

  let strokeColor = luma(70)
  let backgroundColor = luma(240)

  if color == "red" {
    strokeColor = rgb(237, 32, 84)
    backgroundColor = rgb(253, 228, 224)
  } else if color == "green" {
    strokeColor = rgb(102, 174, 62)
    backgroundColor = rgb(235, 244, 222)
  } else if color == "blue" {
    strokeColor = rgb(29, 144, 208)
    backgroundColor = rgb(232, 246, 253)
  }

  return box(
    fill: backgroundColor,
    stroke: 2pt + strokeColor,
    radius: radius,
    width: width
  )[
    #box(
      fill: strokeColor, 
      inset: 6pt,
      radius: (top-left: radius, bottom-right: radius),
    )[
      #text(fill: white, weight: "bold")[#title]
    ]
    #box(
      width: 100%,
      inset: (x: 8pt, bottom: 8pt)
    )[
      #body
    ]
  ]
}


#let stickybox(rotation: 0deg, width: 100%, body) = {
  let stickyYellow = rgb(255, 240, 172)
  
  return rotate(rotation)[
    #block(width: width)[
      #box(
        fill: stickyYellow,
      )[
        #place(top + center, dy: -10pt)[
          #box(
            fill: rgb(0,0,0,25), 
            width: 1.5in,
            height: 20pt,
          )
        ]
        #box(
          width: 100%,
          inset: (top:18pt, x: 8pt, bottom: 8pt)
        )[
          #body
        ]
      ]
    ]
  ]
}