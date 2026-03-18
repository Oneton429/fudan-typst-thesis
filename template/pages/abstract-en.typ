// ============================================================
// 复旦大学学位论文 Typst 模板 - 英文摘要页
// 包含：摘要正文、关键词、中图分类号
// ============================================================

#import "../config.typ": *

#let abstract-en-page(
  abstract-body: [],
  keywords: (),
  clc: none,
) = {
  set text(font: font-family.宋体, size: font-size.小四)
  set par(first-line-indent: 2em, leading: 1.0em, justify: true)
  abstract-body

  v(20pt)

  // Keywords
  par(first-line-indent: 0em)[
    #text(font: font-family.黑体, weight: "bold")[Keywords: ]
    #text(font: font-family.宋体)[#keywords.join("; ")]
  ]

  // CLC
  if clc != none {
    v(6pt)
    par(first-line-indent: 0em)[
      #text(font: font-family.黑体, weight: "bold")[CLC: ]
      #text(font: font-family.宋体)[#clc]
    ]
  }
}
