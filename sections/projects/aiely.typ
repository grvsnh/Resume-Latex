#block(above: 6pt, below: 0pt, breakable: false)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    [#text(weight: "bold")[Aiely — Desktop AI Assistant] · #text(size: 9.2pt, fill: rgb("#555555"))[#emph[Electron, TypeScript, OpenRouter API, Web Speech]]],
    [#link("https://github.com/grvsnh/aiely")[_GitHub_]],
  )
  - Built a cross-platform desktop AI assistant with a transparent HUD, dual-channel audio streaming, and screen-OCR context, reaching *under 250 ms time-to-first-token*.
  - Engineered *dynamic multi-LLM failover routing* across Claude, GPT-4o, and DeepSeek through OpenRouter, mitigating rate limits and maintaining zero-downtime responses.
]
