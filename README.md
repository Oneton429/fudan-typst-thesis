# 复旦大学学位论文 Typst 模板

复旦大学本科/硕士/博士毕业论文 Typst 模板，遵循《复旦大学博士、硕士学位论文规范（2024年10月修订版）》。

## 功能特性

- 支持本科、硕士、博士三种学位类型，学术学位与专业学位两种类别
- 盲审模式：一键隐藏个人信息；双面打印：自动插入空白页
- 章节中文编号，图表公式按章编号（图 1-1、表 2-3、式 3-1）
- GB/T 7714-2015 参考文献格式，自动生成封面、独创性声明、目录
- 支持涉密论文、副指导教师、扉页（指导小组）、附录等
- 内置 Windows / macOS / Linux 多平台字体回退方案

## 项目结构

```
fdu-typst-thesis/
├── main.typ                # 【主入口】论文信息、章节组织
├── template/               # 模板核心（一般无需修改）
│   ├── thesis.typ          # 模板主函数
│   ├── config.typ          # 全局配置（字号、字体、页边距）
│   ├── utils.typ           # 工具函数
│   ├── styles.typ          # 页眉页脚样式
│   ├── components.typ      # 可复用组件（三线表等）
│   └── pages/              # 封面、声明、摘要、目录等页面模板
├── chapters/               # 论文内容（主要编辑这里）
│   ├── abstract.typ        # 中英文摘要
│   ├── chapter1.typ ~ ...  # 正文章节
│   ├── appendix.typ        # 附录
│   └── acknowledgements.typ# 致谢
├── ref/references.bib      # 参考文献（BibTeX）
├── figures/                # 用户图片
└── images/fudan-name.png   # 校名图片（封面使用）
```

## 快速开始

### 1. 安装 Typst

访问 [Typst 官网](https://typst.app/) 下载安装，或通过包管理器：

```bash
brew install typst          # macOS
scoop install typst         # Windows
pacman -S typst             # Arch Linux
```

### 2. 下载模板

```bash
git clone https://github.com/MobtgZhang/fdu-typst-thesis.git
cd fdu-typst-thesis
```

### 3. 编辑论文

编辑 `main.typ` 填写论文信息，在 `chapters/` 下编写各章节内容，在 `ref/references.bib` 中添加参考文献。

### 4. 编译

```bash
typst compile main.typ                # 基本编译
typst watch main.typ                  # 实时预览
typst compile main.typ --input blind=true   # 盲审版本
typst compile main.typ --input twoside=true # 双面打印
```

推荐使用 VS Code / Cursor + Tinymist 插件获得语法高亮和实时预览。

## 配置参数

### thesis() 主要参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `info` | 字典 | 论文基本信息（见下表） |
| `abstract-zh` / `abstract-en` | 内容 | 中/英文摘要 |
| `keywords-zh` / `keywords-en` | 数组 | 中/英文关键词 |
| `blind` | 布尔 | 盲审模式（默认 `false`） |
| `twoside` | 布尔 | 双面打印（默认 `false`） |
| `bibliography-content` | 内容 | 参考文献 |
| `acknowledgements` | 内容 | 致谢 |
| `appendix` | 内容 | 附录 |
| `committee` | 数组 | 指导小组成员（设为 `none` 不生成扉页） |

### info 字典主要字段

| 字段 | 说明 |
|------|------|
| `title` / `title-en` | 中/英文标题 |
| `author` | 作者姓名 |
| `student-id` | 学号 |
| `school` / `major` | 院系 / 专业 |
| `supervisor` | 导师（姓名+职称，全角空格分隔） |
| `supervisor-second` | 副导师（可选） |
| `degree` | `"bachelor"` / `"master"` / `"doctor"` |
| `degree-category` | `"学术学位"` / `"专业学位"` / `none` |
| `secret-level` | 密级（如 `"秘密五年"`），非涉密设 `none` |
| `date` | 论文完成日期 |
| `clc` | 中图分类号 |

## 排版示例

```typst
// 图片
#figure(image("figures/example.png", width: 80%), caption: [说明]) <fig:example>

// 三线表
#figure(table(columns: 3, stroke: none,
  table.hline(stroke: 1.5pt),
  table.header([*A*], [*B*], [*C*]),
  table.hline(stroke: 0.75pt),
  [1], [2], [3],
  table.hline(stroke: 1.5pt),
), kind: table, caption: [说明]) <tbl:example>

// 公式
$ P(A | B) = frac(P(B | A) P(A), P(B)) $ <eq:bayes>

// 引用：@fig:example、@tbl:example、@eq:bayes、@author2024title
```

## 字体说明

- **Windows**：SimSun / SimHei / KaiTi / Times New Roman（通常自带）
- **macOS**：STSongti / STHeiti / STKaiti（通常自带）
- **Linux**：推荐安装 Noto CJK 字体：`sudo apt install fonts-noto-cjk fonts-noto-cjk-extra`

编译时可指定字体路径：`typst compile main.typ --font-path /path/to/fonts`

## 参考项目

- [pku-typst/pkuthss-typst](https://github.com/pku-typst/pkuthss-typst)
- [stone-zeng/fduthesis](https://github.com/stone-zeng/fduthesis)

## 开源协议

本项目遵循 [GPL-3.0](LICENSE) 开源协议。
