#let colorbox(title: "title", color: none, radius: 2pt, width: auto, body) = {

  let strokeColor = luma(70)
  let backgroundColor = white

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
    #block(
      fill: strokeColor, 
      inset: 8pt,
      radius: (top-left: radius, bottom-right: radius),
    )[
      #text(fill: white, weight: "bold")[#title]
    ]
    #block(
      width: 100%,
      inset: (x: 8pt, bottom: 8pt)
    )[
      #body
    ]
  ]
}

#let slantedBackground(color: black, body) = {
  set text(fill: white, weight: "bold")
  style(styles => {
    let size = measure(body, styles)
    let inset = 8pt
    [#block()[
      #polygon(
        fill: color,
        (0pt, 0pt),
        (0pt, size.height + (2*inset)),
        (size.width + (2*inset), size.height + (2*inset)),
        (size.width + (2*inset) + 6pt, 0cm)
      )
      #place(center + top, dy: size.height, dx: -3pt)[#body]
    ]]
  })
}

#let slantedColorbox(title: "title", color: none, radius: 0pt, width: auto, body) = {

  let strokeColor = luma(70)
  let backgroundColor = white

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
    #slantedBackground(color: strokeColor)[#title]
    #block(
      width: 100%,
      inset: (top: -2pt, x: 10pt, bottom: 10pt)
    )[
      #body
    ]
  ]
}

#let outlinebox(title: "title",color: none, width: 100%, radius: 2pt, centering: false, body) = {

  let strokeColor = luma(70)

  if color == "red" {
    strokeColor = rgb(237, 32, 84)
  } else if color == "green" {
    strokeColor = rgb(102, 174, 62)
  } else if color == "blue" {
    strokeColor = rgb(29, 144, 208)
  }
  
  return block(
      stroke: 2pt + strokeColor,
      radius: radius,
      width: width,
      above: 26pt,
    )[
      #if centering [
        #place(top + center, dy: -12pt)[
          #block(
            fill: strokeColor,
            inset: 8pt,
            radius: radius,
          )[
            #text(fill: white, weight: "bold")[#title]
          ]
        ]
      ] else [
        #place(top + start, dy: -12pt, dx:20pt)[
          #block(
            fill: strokeColor,
            inset: 8pt,
            radius: radius,
          )[
            #text(fill: white, weight: "bold")[#title]
          ]
        ]
      ]
      
      #block(
        width: 100%,
        inset: (top:20pt, x: 10pt, bottom: 10pt)
      )[
        #body
      ]
    ]
}

#let stickybox(rotation: 0deg, width: 100%, body) = {
  let stickyYellow = rgb(255, 240, 172)
  let sticky = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><svg width=\"10px\" height=\"10px\" viewBox=\"0 0 10 10\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><g id=\"Page-1\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\" fill-opacity=\"0.1\"><rect id=\"sticky\" fill=\"#000000\" x=\"0\" y=\"0\" width=\"10\" height=\"10\"></rect></g></svg>"
  let background-shadow = "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <svg width=\"136px\" height=\"30px\" viewBox=\"0 0 136 30\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"> <title>background</title> <g id=\"background\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\" fill-opacity=\"0.04\"> <path d=\"M0,4 L136,4 L136,30 C113.333333,27.3333333 90.6666667,26 68,26 C45.3333333,26 22.6666667,27.3333333 0,30 L0,4 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M1,5 L135,5 L135,29 C112.666667,26.5384615 90.3333333,25.3076923 68,25.3076923 C45.6666667,25.3076923 23.3333333,26.5384615 1,29 L1,5 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M2,4 L134,4 L134,28 C112,25.5384615 90,24.3076923 68,24.3076923 C46,24.3076923 24,25.5384615 2,28 L2,4 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M2,4 L133,4 L133,28 C111.166667,25.5384615 89.3333333,24.3076923 67.5,24.3076923 C45.6666667,24.3076923 23.8333333,25.5384615 2,28 L2,4 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M3,3 L132,3 L132,27 C110.5,24.5384615 89,23.3076923 67.5,23.3076923 C46,23.3076923 24.5,24.5384615 3,27 L3,3 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M4,2 L131,2 L131,26 C109.833333,23.5384615 88.6666667,22.3076923 67.5,22.3076923 C46.3333333,22.3076923 25.1666667,23.5384615 4,26 L4,2 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M5,1 L130,1 L130,25 C109.166667,22.5384615 88.3333333,21.3076923 67.5,21.3076923 C46.6666667,21.3076923 25.8333333,22.5384615 5,25 L5,1 Z\" id=\"Rectangle\" fill=\"#000000\"></path> <path d=\"M6,0 L129,0 L129,24 C108.5,21.5384615 88,20.3076923 67.5,20.3076923 C47,20.3076923 26.5,21.5384615 6,24 L6,0 Z\" id=\"Rectangle\" fill=\"#000000\"></path> </g> </svg>"
  return rotate(rotation)[
    #let shadow = 100%
    #if width != 100% {
      shadow = width
    }
    #place(bottom + center, dy: 0.035*shadow)[
        #image.decode(
          background-shadow,
          width: shadow,
          height: auto,
        )
      ]
    #block(
      fill: stickyYellow,
      width: width
    )[   
      #place(top + center, dy: -2mm)[
        #image.decode(
          sticky,
          width: 10mm,
          height: 4mm,
        )
      ]
      #block(
        width: 100%,
        inset: (top:12pt, x: 8pt, bottom: 8pt)
      )[
        #body
      ]
    ]
  ]
}
