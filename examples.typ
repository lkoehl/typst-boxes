#import "typst-boxes.typ": *

#set page(paper: "a4", margin: 1cm, height: auto)

#set par(justify: true)
#set text(fill: black)

#colorbox(title: lorem(2))[#lorem(50)]

#colorbox(
  title: lorem(2),
  color: "red")[
    #lorem(50)
]

#colorbox(
  title: lorem(2),
  color: "blue")[
    #lorem(50)
]

#colorbox(
  title: lorem(2),
  color: "green",
  width: 10cm)[
    #lorem(20)
]
