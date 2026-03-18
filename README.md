# 复旦大学学位论文 Typst 模板

复旦大学本科/硕士/博士毕业论文 Typst 模板，严格遵循《复旦大学博士、硕士学位论文规范（2024年10月修订版）》。

## 功能特性

- **多学位支持**：本科（bachelor）、硕士（master）、博士（doctor），默认为博士学位论文
- **学位类别**：支持学术学位和专业学位两种类别
- **盲审模式**：一键隐藏作者、导师、院系等个人信息，方便盲审提交
- **双面打印**：自动在章节间插入空白页，保证奇数页从右侧开始
- **自动编号**：章节中文编号（第一章、第二章...），图表公式按章编号（图 1-1、表 2-3、式 3-1）
- **参考文献**：默认使用 GB/T 7714-2015 数字引用格式
- **目录系统**：章节目录、插图目录、表格目录（可选）
- **封面自动生成**：根据学位类型自动切换封面样式（研究生/本科/盲审三种模式）
- **独创性声明**：自动生成论文独创性声明和论文使用授权声明
- **扉页**：可选生成指导小组成员名单页
- **附录支持**：使用字母编号（附录 A、附录 B...）
- **涉密论文**：支持在封面标注密级和保密年限
- **跨平台字体**：内置 Windows / macOS / Linux 多平台字体回退方案

## 项目结构

```
fdu-typst-thesis/
├── main.typ                     # 【主入口】编辑论文信息、组织章节
├── typst.toml                   # Typst 包配置文件
├── README.md                    # 本说明文档
├── images/                      # 图片资源目录
│   └── fudan-name.png           # 复旦大学校名图片（封面使用）
├── template/                    # 模板核心文件（一般无需修改）
│   ├── thesis.typ               # 模板主函数，组装全部页面
│   ├── config.typ               # 字号、字体、页边距等全局配置
│   ├── utils.typ                # 工具函数（中文编号、日期格式化等）
│   ├── fonts.typ                # 字体兼容层（向后兼容）
│   ├── styles.typ               # 页眉页脚样式
│   ├── components.typ           # 可复用组件（三线表、代码块等）
│   └── pages/                   # 各特殊页面模板
│       ├── cover.typ            # 封面（研究生/本科/盲审三种）
│       ├── declaration.typ      # 独创性声明与授权声明
│       ├── committee.typ        # 扉页（指导小组成员名单）
│       ├── abstract-zh.typ      # 中文摘要页
│       ├── abstract-en.typ      # 英文摘要页
│       └── outline-page.typ     # 目录页
├── chapters/                    # 论文内容（主要编辑这里）
│   ├── abstract.typ             # 中英文摘要内容
│   ├── chapter1.typ             # 第一章
│   ├── chapter2.typ             # 第二章
│   ├── chapter3.typ             # 第三章
│   ├── appendix.typ             # 附录
│   └── acknowledgements.typ     # 致谢
├── ref/
│   └── references.bib           # 参考文献数据库（BibTeX 格式）
└── figures/                     # 用户图片目录
```

## 快速开始

### 第一步：安装 Typst

Typst 是一种现代化排版系统，编译速度极快，语法简洁。请选择以下方式之一安装：

**方式一：官网下载（推荐）**

访问 [Typst 官网](https://typst.app/) ，点击 "Install" 下载对应操作系统的安装包。

**方式二：通过包管理器安装**

```bash
# macOS (Homebrew)
brew install typst

# Windows (Scoop)
scoop install typst

# Linux (Cargo)
cargo install --git https://github.com/typst/typst --locked typst-cli

# Arch Linux
pacman -S typst
```

**方式三：在线使用**

访问 [typst.app](https://typst.app) 可直接在浏览器中编辑和编译。

安装完成后，在终端中运行以下命令验证：

```bash
typst --version
```

### 第二步：安装编辑器插件（推荐）

推荐使用 **VS Code** 配合 **Tinymist** 插件进行编辑，可获得语法高亮、自动补全和实时预览功能：

1. 安装 [VS Code](https://code.visualstudio.com/)
2. 在扩展商店中搜索并安装 `Tinymist Typst`
3. 打开 `.typ` 文件后，按 `Ctrl+Shift+P` → 输入 "Typst Preview" 可实时预览

也可以使用 [Cursor](https://www.cursor.com/) 编辑器，同样支持 Tinymist 插件。

### 第三步：下载模板

```bash
git clone https://github.com/MobtgZhang/fdu-typst-thesis.git
cd fdu-typst-thesis
```

### 第四步：准备校名图片

封面需要使用复旦大学校名图片。请在项目根目录创建 `images/` 文件夹，并放入 `fudan-name.png` 文件（毛泽东题写的校名图片）：

```bash
mkdir -p images
# 将校名图片复制到 images/fudan-name.png
```

### 第五步：填写论文信息

编辑 `main.typ` 文件，修改 `info` 字典中的论文信息：

```typst
#show: thesis.with(
  info: (
    title: "你的论文中文标题",
    title-en: "Your English Title",
    author: "你的姓名",
    student-id: "你的学号",
    school: "你的院系全称",
    major: "你的学科专业",
    supervisor: "导师姓名　职称",
    degree: "doctor",            // "bachelor" / "master" / "doctor"
    degree-category: "学术学位",  // "学术学位" / "专业学位" / none
    date: datetime.today(),
    clc: "TP391",                // 中图分类号
  ),
  // ... 其他参数
)
```

### 第六步：编写摘要

编辑 `chapters/abstract.typ`，分别填写中英文摘要和关键词：

```typst
#let abstract-zh = [
  你的中文摘要内容...
]

#let keywords-zh = ("关键词1", "关键词2", "关键词3")

#let abstract-en = [
  Your English abstract...
]

#let keywords-en = ("Keyword1", "Keyword2", "Keyword3")
```

### 第七步：编写正文章节

在 `chapters/` 目录下编写各章内容。每个章节文件以一级标题开头：

```typst
// chapters/chapter1.typ
= 绪论

== 研究背景

正文内容...

== 研究意义

正文内容...
```

在 `main.typ` 底部通过 `#include` 引入章节：

```typst
#include "chapters/chapter1.typ"
#include "chapters/chapter2.typ"
// 添加更多章节...
```

### 第八步：编写致谢

编辑 `chapters/acknowledgements.typ`：

```typst
#let acknowledgements-content = [
  致谢内容...
]
```

### 第九步：添加参考文献

在 `ref/references.bib` 中添加 BibTeX 格式的参考文献条目：

```bibtex
@article{author2024title,
  author  = {Author, First and Author, Second},
  title   = {Paper Title},
  journal = {Journal Name},
  year    = {2024},
  volume  = {1},
  pages   = {1--10},
}
```

在正文中使用 `@author2024title` 引用参考文献。

### 第十步：编译

```bash
# 基本编译
typst compile main.typ

# 实时预览（保存后自动重新编译）
typst watch main.typ

# 指定字体路径（如果系统缺少中文字体）
typst compile main.typ --font-path /path/to/fonts

# 盲审版本
typst compile main.typ --input blind=true

# 双面打印版本
typst compile main.typ --input twoside=true

# 同时启用盲审和双面打印
typst compile main.typ --input blind=true --input twoside=true
```

编译成功后会在当前目录生成 `main.pdf` 文件。

## 详细配置说明

### thesis() 函数参数

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `info` | 字典 | 见下表 | 论文基本信息 |
| `abstract-zh` | 内容 | `[]` | 中文摘要正文 |
| `keywords-zh` | 数组 | `()` | 中文关键词列表 |
| `abstract-en` | 内容 | `[]` | 英文摘要正文 |
| `keywords-en` | 数组 | `()` | 英文关键词列表 |
| `blind` | 布尔 | `false` | 盲审模式，隐藏个人信息 |
| `twoside` | 布尔 | `false` | 双面打印模式 |
| `outline-depth` | 整数 | `3` | 目录显示层级深度 |
| `list-of-image` | 布尔 | `false` | 是否生成插图目录 |
| `list-of-table` | 布尔 | `false` | 是否生成表格目录 |
| `bibliography-content` | 内容/none | `none` | 参考文献内容 |
| `acknowledgements` | 内容/none | `none` | 致谢内容 |
| `appendix` | 内容/none | `none` | 附录内容 |
| `committee` | 数组/none | `none` | 指导小组成员列表 |

### info 字典字段

| 字段 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `title` | 字符串 | `"论文题目"` | 中文标题（不超过30个汉字） |
| `title-en` | 字符串/none | `"Thesis Title"` | 英文标题 |
| `author` | 字符串 | `"作者姓名"` | 作者姓名 |
| `student-id` | 字符串 | `"00000000000"` | 学号 |
| `school` | 字符串 | `"院系名称"` | 院系正式全称 |
| `major` | 字符串 | `"专业名称"` | 学术学位填学科专业，专业学位填专业学位类别（领域） |
| `supervisor` | 字符串 | `"导师姓名　教授"` | 指导教师（姓名+职称，中间用全角空格分隔） |
| `supervisor-second` | 字符串/none | `none` | 副指导教师（可选） |
| `degree` | 字符串 | `"doctor"` | 学位类型：`"bachelor"` / `"master"` / `"doctor"` |
| `degree-category` | 字符串/none | `none` | 学位类别：`"学术学位"` / `"专业学位"` |
| `secret-level` | 字符串/none | `none` | 密级（如 `"秘密五年"`、`"机密十年"`），非涉密论文设为 `none` |
| `equivalent-education` | 布尔 | `false` | 是否为同等学力人员 |
| `english-program` | 布尔 | `false` | 是否为英文项目 |
| `date` | datetime | `datetime.today()` | 论文完成日期 |
| `clc` | 字符串/none | `none` | 中图分类号 |

## 各类学位论文配置示例

### 博士学术学位论文（默认）

```typst
info: (
  title: "基于深度学习的自然语言处理研究",
  title-en: "Research on Natural Language Processing Based on Deep Learning",
  author: "张三",
  student-id: "21110000000",
  school: "计算机科学技术学院",
  major: "计算机科学与技术",
  supervisor: "李四　教授",
  degree: "doctor",
  degree-category: "学术学位",
  date: datetime.today(),
  clc: "TP391",
)
```

### 博士专业学位论文

```typst
info: (
  degree: "doctor",
  degree-category: "专业学位",
  major: "电子信息",  // 专业学位填类别（领域）
  // ... 其他字段
)
```

### 硕士学术学位论文

```typst
info: (
  degree: "master",
  degree-category: "学术学位",
  // ... 其他字段
)
```

### 硕士专业学位论文

```typst
info: (
  degree: "master",
  degree-category: "专业学位",
  major: "电子信息",  // 专业学位填类别（领域）
  // ... 其他字段
)
```

### 本科毕业论文

```typst
info: (
  degree: "bachelor",
  // 本科无需设置 degree-category
  // ... 其他字段
)
```

### 涉密论文

```typst
info: (
  secret-level: "秘密五年",  // 或 "机密十年" 等
  // ... 其他字段
)
```

### 有副指导教师

```typst
info: (
  supervisor: "李四　教授",
  supervisor-second: "王五　副教授",
  // ... 其他字段
)
```

## 命令行参数

支持通过 `--input` 传递编译参数，优先级高于 `main.typ` 中的配置：

```bash
# 盲审模式
typst compile main.typ --input blind=true

# 双面打印
typst compile main.typ --input twoside=true

# 组合使用
typst compile main.typ --input blind=true --input twoside=true
```

## 排版功能

### 图片插入

```typst
#figure(
  image("figures/example.png", width: 80%),
  caption: [图片说明文字],
) <fig:example>

如@fig:example 所示，...   // 自动生成"图 1-1"格式引用
```

### 三线表

```typst
#figure(
  table(
    columns: 4,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([*列1*], [*列2*], [*列3*], [*列4*]),
    table.hline(stroke: 0.75pt),
    [数据], [数据], [数据], [数据],
    table.hline(stroke: 1.5pt),
  ),
  kind: table,
  caption: [表格说明文字],
) <tbl:example>
```

### 数学公式

```typst
// 行内公式
$E = m c^2$

// 独立公式（自动按章编号）
$ P(A | B) = frac(P(B | A) P(A), P(B)) $ <eq:bayes>

// 引用公式
如@eq:bayes 所示，...    // 自动生成"式(1-1)"格式引用
```

### 代码块

````typst
```python
def hello():
    print("Hello, World!")
```
````

### 参考文献引用

```typst
深度学习推动了 NLP 领域的进步@author2024title。
```

### 脚注

```typst
这是正文内容#footnote[这是脚注内容。]。
```

## 扉页配置

如需生成指导小组成员名单页（扉页），在 `main.typ` 中设置 `committee` 参数：

```typst
#show: thesis.with(
  committee: (
    "张三　教授　　复旦大学",
    "李四　副教授　复旦大学",
    "王五　研究员　中国科学院",
  ),
  // ...
)
```

设为 `none`（默认）则不生成扉页。

## 附录

在 `chapters/appendix.typ` 中编写附录内容，附录标题自动使用大写字母编号：

```typst
// chapters/appendix.typ
= 补充实验数据

附录正文内容...

= 代码实现

附录正文内容...
```

编译后显示为"附录 A 补充实验数据"、"附录 B 代码实现"。

## 字体配置

模板使用以下字体（按优先级排列，自动回退）：

| 用途 | Windows | macOS | Linux |
|------|---------|-------|-------|
| 中文正文（宋体） | SimSun | STSongti | Noto Serif CJK SC |
| 中文标题（黑体） | SimHei | STHeiti | Noto Sans CJK SC |
| 中文楷体 | KaiTi | STKaiti | — |
| 中文仿宋 | FangSong | STFangsong | — |
| 英文正文 | Times New Roman | Times New Roman | Times New Roman |
| 代码 | Courier New | Courier New | Courier New |

### Linux 用户字体安装

Linux 系统通常缺少中文字体，推荐安装方式：

**方式一：安装 Noto CJK 字体（推荐）**

```bash
# Ubuntu / Debian
sudo apt install fonts-noto-cjk fonts-noto-cjk-extra

# Fedora
sudo dnf install google-noto-serif-cjk-sc-fonts google-noto-sans-cjk-sc-fonts

# Arch Linux
sudo pacman -S noto-fonts-cjk
```

**方式二：从 Windows 复制字体**

```bash
sudo mkdir -p /usr/share/fonts/winfonts
sudo cp /path/to/windows/fonts/*.ttf /usr/share/fonts/winfonts/
sudo cp /path/to/windows/fonts/*.TTF /usr/share/fonts/winfonts/
sudo fc-cache -fv
```

常用的 Windows 字体文件：`simsun.ttc`（宋体）、`simhei.ttf`（黑体）、`simkai.ttf`（楷体）、`simfang.ttf`（仿宋）、`times.ttf`（Times New Roman）。

**方式三：编译时指定字体路径**

```bash
typst compile main.typ --font-path /path/to/your/fonts/
```

### macOS 用户

macOS 自带华文字体（STSongti、STHeiti 等），通常无需额外安装。如有字体缺失，可安装 Noto CJK 字体：

```bash
brew install font-noto-serif-cjk-sc font-noto-sans-cjk-sc
```

### 查看系统可用字体

```bash
typst fonts
```

## 论文结构顺序

模板按以下顺序自动组装论文各部分：

1. **封面** — 根据学位类型自动选择样式
2. **独创性声明和使用授权声明** — 非盲审时自动生成
3. **扉页** — 指导小组成员名单（可选）
4. **中文摘要** — 含关键词和中图分类号
5. **英文摘要** — 含 Keywords 和 CLC
6. **目录** — 可选生成插图目录和表格目录
7. **正文** — 各章节内容
8. **参考文献** — GB/T 7714-2015 格式
9. **附录** — 字母编号（可选）
10. **致谢** — 非盲审时显示

## 常见问题

### Q: 编译时出现 "unknown font family" 警告

这是字体回退警告，表示系统中缺少某些字体，Typst 会自动使用列表中的下一个可用字体。如果 PDF 输出正常，可以忽略这些警告。如需消除警告，请参考上方字体安装说明。

### Q: 封面上的校名图片不显示

请确保 `images/fudan-name.png` 文件存在。封面代码引用的是 `../../images/fudan-name.png`（相对于 `template/pages/cover.typ`）。

### Q: 如何添加新章节

1. 在 `chapters/` 目录下创建新文件（如 `chapter4.typ`）
2. 以一级标题开头编写内容（`= 章节标题`）
3. 在 `main.typ` 底部添加 `#include "chapters/chapter4.typ"`

### Q: 如何修改页边距

编辑 `template/config.typ` 中的 `page-margin` 变量：

```typst
#let page-margin = (top: 2.54cm, bottom: 2.54cm, left: 3.17cm, right: 3.17cm)
```

### Q: 如何自定义页眉内容

编辑 `template/styles.typ` 中的 `make-header` 函数。默认页眉显示"复旦大学XX学位论文"。

### Q: 参考文献格式不正确

确保 `ref/references.bib` 中的条目格式正确。模板默认使用 `gb-7714-2015-numeric` 样式（国标顺序编码制）。如需使用著者-出版年制，可改为 `gb-7714-2015-author-date`。

## 参考项目

- [MobtgZhang/fudan-typst-thesis](https://github.com/MobtgZhang/fudan-typst-thesis) — 复旦大学硕博毕业设计论文 Typst 模板
- [pku-typst/pkuthss-typst](https://github.com/pku-typst/pkuthss-typst) — 北京大学学位论文 Typst 模板
- [sysu/better-thesis](https://github.com/sysu/better-thesis) — 中山大学学位论文 Typst 模板
- [stone-zeng/fduthesis](https://github.com/stone-zeng/fduthesis) — 复旦大学 LaTeX 论文模板

## 开源协议

本项目遵循 [GPL-3.0](LICENSE) 开源协议。
