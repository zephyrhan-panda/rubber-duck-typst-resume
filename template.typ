// const color
#let color_darknight = rgb("#131A28")
#let color_darkgray = rgb("333333")

// layout utility
#let justify_align(left_body, right_body) = {
  block[
    #left_body
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let justify_align_3(left_body, mid_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(center)[
        #mid_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let resume(author: (:), date: "", body) = {
  set document(
    author: author.firstname + " " + author.lastname, 
    title: "resume",
  )
  
  set text(
    font: ("New Computer Modern", "Source Han Serif SC"), // 加入中文字体支持
    lang: "zh",
    size: 11pt,
    fill: color_darknight,
    fallback: true
  )

  set page(
    paper: "a4",
    margin: (left: 0.30in, right: 0.30in, top: 0.20in, bottom: 0.20in),
    footer: [
      #set text(fill: gray, size: 8pt, font: ("Source Sans Pro"), ligatures: false,)
      #justify_align_3[
        #smallcaps[#date]
      ][
        #smallcaps[
          #author.firstname
          #author.lastname
          #sym.dot.c
          #"Résumé"
        ]
      ][
        #counter(page).display()
      ]
    ],
    footer-descent: 0pt,
  )
  
  show par: set block(above: 0.75em, below: 0.75em)
  set par(justify: true)

  set heading(numbering: none, outlined: false)
  
  let name = {
    align(center)[
      #pad(bottom: 5pt)[
        #block[
          #set text(size: 25pt, style: "normal")
          #text(weight: "light")[#author.firstname ]
          #text(weight: "light")[#author.lastname]
        ]
      ]
    ]
  }

  let positions = {
    if "positions" in author {
      set text(size: 9pt, weight: "regular", ligatures: false)
      align(center)[
        #smallcaps[
          #author.positions.join(text[#" "#sym.dot.c#" "])
        ]
      ]
    }
  }

  let contacts = {
    set text(size: 10pt)
    let separator = box(width: 5pt)
    
    align(center)[
      #block[
        #align(horizon)[
          // 地点
          #if "location" in author [#author.location #separator]
          // 邮件
          #if "email" in author [
            #link("mailto:" + author.email)[#author.email] #separator
          ]
          // GitHub
          #if "github" in author [
            #link("https://github.com/" + author.github)[#author.github] #separator
          ]
          // 个人附加信息 (GPA, IELTS 等)
          #if "personalInfo" in author [
            #author.personalInfo.join(separator)
          ]
        ]
      ]
    ] 
  }

  name
  positions
  contacts
  body
}


#let resume_section(title) = {
  set text(size: 16pt, weight: "thin")
  v(5pt)
  align(left)[
    #smallcaps[#title]
    #box(width: 1fr, line(length: 100%, stroke: 0.5pt + color_darknight))
  ]
}

#let resume_item(body) = {
  set text(size: 10pt, style: "normal", weight: "light")
  set par(leading: 0.65em)
  body
}

#let resume_gpa(numerator, denominator) = {
  set text(size: 12pt, style: "normal", weight: "light")
  text[Cumulative GPA: #box[#strong[#numerator] / #denominator]]
}

#let education_item(organization, degree, gpa, time_frame) = {
  pad(top: 5pt)[
    #justify_align[#strong[#organization]][#gpa]
    #justify_align[#emph[#degree]][#resume_time[#time_frame]]
  ]
}

#let work_experience_item_header(company, location, position, time_frame) = {
  pad(top: 5pt)[
    #justify_align[#strong[#company]][#resume_location[#location]]
    #justify_align[#emph[#position]][#resume_time[#time_frame]]
  ]
}

#let personal_project_item_header(name, location, position, start_time) = {
  pad(top: 5pt)[
    #justify_align[#strong[#name]][#resume_location[#location]]
    #justify_align[#emph[#position]][#resume_time[#start_time]]
  ]
}

#let skill_item(category, items) = {
  pad(top: 5pt)[
    #grid(
      columns: (20fr, 80fr),
      gutter: 10pt,
      align(right)[#strong[#category]],
      align(left)[#items.join(", ")]
    )
  ]
}

#let resume_time(body) = { set text(size: 9pt, weight: "light"); body }
#let resume_location(body) = { set text(size: 12pt, weight: "light"); body }
