// ============================================================
// 复旦大学学位论文 Typst 模板 - 可复用组件
// ============================================================

#import "config.typ": *

// 三线表
#let booktab(
  columns: auto,
  caption: none,
  label: none,
  ..args,
) = {
  figure(
    kind: table,
    caption: caption,
    table(
      columns: columns,
      stroke: none,
      table.hline(stroke: 1.5pt),
      table.header(..args.pos().slice(0, columns.len())),
      table.hline(stroke: 0.75pt),
      ..args.pos().slice(columns.len()),
      table.hline(stroke: 1.5pt),
    ),
  )
  if label != none { [#label] }
}

// 带编号的代码块
#let codeblock(
  code,
  caption: none,
  lang: none,
) = {
  figure(
    kind: raw,
    supplement: [代码],
    caption: caption,
    {
      set text(font: font-family.等宽, size: font-size.五号)
      set par(first-line-indent: 0em)
      block(
        width: 100%,
        fill: luma(245),
        inset: 10pt,
        radius: 3pt,
        code,
      )
    },
  )
}
