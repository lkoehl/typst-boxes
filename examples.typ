#import "typst-boxes.typ": *

#set page(paper: "a4", margin: 1cm, height: auto,)
#set par(justify: true)
#set text(fill: black)

#colorbox(
  title: lorem(5),
  color: "blue",
  radius: 2pt,
  width: auto
)[
  #lorem(50)
]

#slantedColorbox(
  title: lorem(5),
  color: "red",
  radius: 0pt,
  width: auto
)[
  #lorem(50)
]

#outlinebox(
  title: lorem(5),
  color: none,
  width: auto,
  radius: 2pt,
  centering: false
)[
  #lorem(50)
]

#outlinebox(
  title: lorem(5),
  color: "green",
  width: auto,
  radius: 2pt,
  centering: true
)[
  #lorem(50)
]

#v(8pt)
#stickybox(
  rotation: 3deg,
  width: 6cm
)[
  #lorem(20)
]
