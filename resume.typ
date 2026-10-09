#import "links/email.typ": email
#import "links/github.typ": github
#import "links/linkedin.typ": linkedin
#import "links/location.typ": location
#import "links/website.typ": website

#set page(
  paper: "a4",
  margin: 0.5in,
  numbering: none,
)
#set text(
  font: "New Computer Modern",
  size: 10pt,
  lang: "en",
)
#set par(
  justify: false,
  leading: 0.6em,
  spacing: 3pt,
)
#set block(above: 2pt, below: 2pt)
#set heading(numbering: none)
#set list(indent: 0pt, body-indent: 11pt, spacing: 3pt)

#show link: set text(fill: black)
#show heading.where(level: 2): set text(size: 11.5pt, weight: "bold", tracking: 0.04em)
#show heading.where(level: 2): set block(
  above: 8pt,
  below: 5pt,
  width: 100%,
  inset: (bottom: 4pt),
  stroke: (bottom: 0.5pt),
)
#show list: set list(tight: false)
#show list: set block(above: 3pt, below: 0pt)

#let name = "Gaurav Singh"
#let role = read("release-info.txt").split("\n").at(0).trim()
#let focus = "Computer Vision, LLM Systems & Applied Machine Learning"

#set document(
  title: name + " - " + role + " Resume",
  author: name,
)

#align(center)[
  #text(size: 22pt, weight: "bold")[#name]
  #v(5pt)
  #text(size: 10.5pt, weight: "bold")[#role]
  #text(size: 10.5pt)[ | #focus]
  #v(4pt)
  #text(size: 8.1pt)[
    #location ·
    #link("mailto:" + email)[#email] ·
    #link("https://linkedin.com/in/" + linkedin)[linkedin.com/in/#linkedin] ·
    #link("https://github.com/" + github)[github.com/#github] ·
    #link("https://" + website)[#website]
  ]
]

// SUMMARY intentionally omitted from the active one-page resume.
// == SUMMARY
// #include "sections/summary.typ"

== TECHNICAL SKILLS
#include "sections/skills/ai-ml.typ"
#include "sections/skills/back-end.typ"
#include "sections/skills/languages.typ"
#include "sections/skills/database.typ"

== PROJECTS
#include "sections/projects/image-colorization.typ"
#include "sections/projects/brainscan.typ"
#include "sections/projects/aiely.typ"
#include "sections/projects/f1-strategy.typ"

== EXPERIENCE
#include "sections/experience/internship.typ"

== EDUCATION
#include "sections/education/btech.typ"
// Optional school-level education; uncomment for an academic-focused variant.
// #include "sections/education/higher-school.typ"
// #include "sections/education/high-school.typ"

== CERTIFICATIONS
#include "sections/certifications/cs50.typ"
#include "sections/certifications/nptel-cloud.typ"
#include "sections/certifications/postman.typ"
#include "sections/certifications/deloitte.typ"

== LEADERSHIP & VOLUNTEERING
#include "sections/misc/aura.typ"
#include "sections/misc/nss.typ"
#include "sections/misc/aicte.typ"
