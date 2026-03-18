// ============================================================
// 复旦大学学位论文 Typst 模板 - 全局配置
// ============================================================

// 字号定义（中文字号 → pt 映射）
#let font-size = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
)

// 字体族定义（跨平台 fallback: Windows / macOS / Linux）
#let font-family = (
  宋体: ("Times New Roman", "SimSun", "STSongti-SC-Regular", "Noto Serif CJK SC", "Source Han Serif SC"),
  黑体: ("Times New Roman", "SimHei", "STHeiti", "Noto Sans CJK SC", "Source Han Sans SC"),
  楷体: ("Times New Roman", "KaiTi", "STKaiti", "Noto Serif CJK SC"),
  仿宋: ("Times New Roman", "FangSong", "STFangsong", "Noto Serif CJK SC"),
  行楷: ("STXingkai", "华文行楷", "FZXingKai-S04S", "AR PL UKai CN", "KaiTi", "STKaiti", "Noto Serif CJK SC"),
  等宽: ("New Computer Modern Mono", "Courier New", "Consolas", "Noto Sans Mono CJK SC"),
)

// 页面设置常量（A4 纸张，Word 默认页边距）
#let page-margin = (top: 2.54cm, bottom: 2.54cm, left: 3.17cm, right: 3.17cm)

// 学校信息
#let school-code = "10246"
#let school-name = "复旦大学"

// 引用记号
#let ref-markers = (
  图: "图",
  表: "表",
  公式: "式",
  节: "节",
  代码: "代码",
)
