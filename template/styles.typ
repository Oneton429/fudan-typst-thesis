// ============================================================
// 复旦大学学位论文 Typst 模板 - 页眉页脚与样式
// ============================================================

#import "config.typ": *
#import "utils.typ": thesis-name

// 页眉生成函数
#let make-header(info: (:), twoside: false) = {
  return context {
    let page-num = counter(page).get().first()
    let header-text = school-name + thesis-name(info.degree)

    set text(font: font-family.宋体, size: font-size.小五)

    if twoside {
      if calc.rem(page-num, 2) == 0 {
        let elems = query(selector(heading.where(level: 1)).before(here()))
        let chapter-title = if elems.len() > 0 {
          let last = elems.last()
          if last.numbering != none {
            numbering(last.numbering, ..counter(heading).at(last.location()))
            h(0.5em)
          }
          last.body
        } else {
          header-text
        }
        align(center, chapter-title)
      } else {
        align(center, header-text)
      }
    } else {
      align(center, header-text)
    }
    v(-8pt)
    line(length: 100%, stroke: 0.5pt)
  }
}

// 正文页脚（阿拉伯数字）
#let make-footer() = {
  return context {
    let page-num = counter(page).get().first()
    align(center, text(
      font: font-family.宋体,
      size: font-size.小五,
      str(page-num),
    ))
  }
}

// 前置部分页脚（罗马数字）
#let make-front-footer() = {
  return context {
    let page-num = counter(page).get().first()
    align(center, text(
      font: font-family.宋体,
      size: font-size.小五,
      numbering("I", page-num),
    ))
  }
}
