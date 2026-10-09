#block(above: 6pt, below: 0pt, breakable: false)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    [#text(weight: "bold")[Image Colorization with Deep Learning] · #text(size: 9.2pt, fill: rgb("#555555"))[#emph[Python, TensorFlow, OpenCV, Streamlit]]],
    [#link("https://github.com/grvsnh/Image-Colorization")[_GitHub_]],
  )
  - Built an end-to-end *LAB colorization pipeline* combining a custom CNN trained on *10,000+ Oxford-IIIT Pet images* with an ECCV model to separate luminance and predict chrominance.
  - Developed a Streamlit application with model-weight caching and visual comparisons, achieving *sub-120 ms inference* per 512 × 512 image and reducing memory usage by *35%*.
]
