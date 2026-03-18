// ============================================================
// 复旦大学学位论文 Typst 模板 - 目录页
// ============================================================

#import "../config.typ": *

// 目录页
#let outline-page(depth: 3) = {
  set text(font: font-family.宋体, size: font-size.小四)
  set par(leading: 1.5em)

  outline(
    title: none,
    depth: depth,
    indent: auto,
  )
}

// 插图目录
#let list-of-figures-page() = {
  set text(font: font-family.宋体, size: font-size.小四)
  set par(leading: 1.5em)

  outline(
    title: none,
    target: figure.where(kind: image),
  )
}

// 表格目录
#let list-of-tables-page() = {
  set text(font: font-family.宋体, size: font-size.小四)
  set par(leading: 1.5em)

  outline(
    title: none,
    target: figure.where(kind: table),
  )
}
