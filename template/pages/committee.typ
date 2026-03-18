// ============================================================
// 复旦大学学位论文 Typst 模板 - 扉页（指导小组成员名单）
// 根据规范：扉页列出指导小组成员名单
// ============================================================

#import "../config.typ": *

#let committee-page(info, committee-members: ()) = {
  set page(margin: page-margin, header: none, footer: none)

  v(60pt)

  align(center, text(
    font: font-family.黑体,
    size: font-size.小二,
    weight: "bold",
  )[指导小组成员名单])

  v(50pt)

  set text(font: font-family.宋体, size: font-size.四号)
  set par(first-line-indent: 0em, leading: 2.0em, justify: true)

  // 论文题目
  align(center)[
    #text(font: font-family.黑体, size: font-size.小三, weight: "bold")[#info.title]
  ]

  v(30pt)

  // 作者信息
  align(center)[
    #text(size: font-size.四号)[#info.author]
    #h(2em)
    #text(size: font-size.四号)[#info.school]
  ]

  v(40pt)

  // 指导小组成员列表
  if committee-members.len() > 0 {
    align(center)[
      #text(font: font-family.黑体, size: font-size.四号, weight: "bold")[指导小组成员]
    ]

    v(20pt)

    set text(font: font-family.宋体, size: font-size.小四)
    set par(leading: 1.5em)

    for member in committee-members {
      align(center)[#member]
      v(4pt)
    }
  }
}
