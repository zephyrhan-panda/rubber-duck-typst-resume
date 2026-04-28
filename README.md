
# 🦆 rubber-duck-typst-resume

<p align="left">
  <img src="./assets/image/duck.svg" width="80" alt="Rubber Duck">
</p>
> "If your duck doesn't understand your CV, neither will the recruiter."

![Typst Version](https://img.shields.io/badge/Typst-0.11.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)

这是一个极简、制作方便、基于 [Typst](https://typst.app/) 的简历引擎。它旨在用最少的代码冗余，生成最具Robustness的简历排版结果。

---

## 项目特性 Core Specs

-  样式与内容完全解耦，修改经历只需填表。
-  借力 Typst 的强类型系统，彻底告别 LaTeX 诡异的溢出报错。
-  没有任何无用的依赖，编译速度快到感知不到。
-  配合 GitHub Actions，实现“推送到 master 即自动发布 PDF”。

## 开发者指令 Dev Commands

项目内置了 `just` 指令集，方便快速调用：

```bash
# 启动开发模式（边改边看）
just dev

# 生产环境编译
just build
