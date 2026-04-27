#import "templates/latex/template.typ": *

#let today = datetime.today()

#show: resume.with(
  author: (
    firstname: "Zephyr", 
    lastname: "Panda",
    positions: ("CS & Math Student", "ML Research Assistant"), 
    location: "温哥华, 加拿大",
    email: "xxx@student.ubc.ca",
    github: "github.com/your-id",
    personalInfo: ([GPA: 94.9/100], [IELTS: 8.0])
  ),
  date: today.display("[month repr:long] [day], [year]")
)

#resume_section("教育背景")

#education_item[
  不列颠哥伦比亚大学 (University of British Columbia)
][
  计算机科学与数学双学位 (B.Sc. Double Major in CS & Math)
][
  #resume_gpa("94.9", "100")
][
  2025.09 - 至今
]

#resume_section("科研与工作经历")

#work_experience_item_header(
  "Michael Smith Laboratories",
  "温哥华, 加拿大",
  "研究助理 (Research Assistant)",
  "2026.01 - 至今",
)

#resume_item[
  - *STABL 算法复现与优化*。负责高维生物医学数据特征选择算法 STABL 的 Python 实现，并针对稳定性选择流水线进行优化。
  - 基于 Python 开发了集成 Lasso 与 ElasticNet 的数据处理框架，显著提升了特征提取的鲁棒性。
  - 探索从生物医学数据处理向自动驾驶及智能体决策（Autonomous Driving & Intelligent Agents）领域的迁移应用。
]

#resume_section("个人项目")

#personal_project_item_header(
  "机器学习特征选择框架",
  "GitHub",
  "Python, Scikit-learn",
  "2026.02",
)

#resume_item[
  - 构建了一个模块化的特征选择评估系统，支持对多种正则化技术的稳定性进行量化对比。
  - 实现了基于 Lagrange 乘子法的优化目标分析。
]

#resume_section("专业技能")

#skill_item(
  "编程语言",
  (strong[Python], strong[Java], strong[C/C++], "LaTeX", "Typst", "SQL")
)

#skill_item(
  "机器学习与数学",
  (strong[Lasso / ElasticNet], "线性代数 (99/100)", "多元微积分", "统计推断")
)
