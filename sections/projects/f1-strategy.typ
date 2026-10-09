#block(above: 6pt, below: 0pt, breakable: false)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    [#text(weight: "bold")[F1 Strategy Lab] · #text(size: 9.2pt, fill: rgb("#555555"))[#emph[Python, FastAPI, Pandas, FastF1, Plotly.js]]],
    [#link("https://github.com/grvsnh/f1-strategy-lab")[#box(fill: rgb("#f3f3f3"), stroke: 0.5pt + black, radius: 2pt, inset: (x: 5pt, y: 2pt))[#text(size: 8.5pt, weight: "bold")[GitHub]]]],
  )
  - Architected a race telemetry analytics platform ingesting *20+ channels at 10 Hz* to model dynamic tyre degradation and evaluate pit stop strategy deltas with *88% predictive accuracy*.
  - Created asynchronous FastAPI data pipelines and interactive Plotly.js sector-delta heatmaps and lap pace comparisons, reducing telemetry load time by *45%*.
]
