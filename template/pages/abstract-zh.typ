// ============================================================
// 复旦大学学位论文 Typst 模板 - 中文摘要页
// 包含：摘要正文、关键词、中图分类号
// ============================================================

#import "../config.typ": *

#let abstract-zh-page(
  abstract-body: [],
  keywords: (),
  clc: none,
) = {
  set text(font: font-family.宋体, size: font-size.小四)
  set par(first-line-indent: 2em, leading: 1.0em, justify: true)
  abstract-body

  v(20pt)

  // 关键词
  par(first-line-indent: 0em)[
    #text(font: font-family.黑体, weight: "bold")[关键词：]
    #text(font: font-family.宋体)[#keywords.join("；")]
  ]

  // 中图分类号
  if clc != none {
    v(6pt)
    par(first-line-indent: 0em)[
      #text(font: font-family.黑体, weight: "bold")[中图分类号：]
      #text(font: font-family.宋体)[#clc]
    ]
  }
}
