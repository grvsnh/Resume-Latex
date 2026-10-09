#block(above: 6pt, below: 0pt, breakable: false)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    [#text(weight: "bold")[BrainScan — Neural Classifier] · #text(size: 9.2pt, fill: rgb("#555555"))[#emph[TensorFlow.js, JavaScript, WebGL, IndexedDB]]],
    [#link("https://grvchnx.github.io/brainscan/")[_Live Demo_]],
  )
  - Built an in-browser MRI brain-tumor classifier with *94.6% validation accuracy* across four categories, keeping scan data client-side.
  - Integrated real-time Grad-CAM saliency heatmaps for interpretability, optimized inference to *under 80 ms per scan* with WebGL, and cut repeat loads by *68%* using IndexedDB caching.
]
