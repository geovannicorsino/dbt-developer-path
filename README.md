# dbt Certified Developer — Learning Path

Repository dedicated to the **[dbt Analytics Engineering Certification](https://learn.getdbt.com/learn/learning-path/dbt-certified-developer)** learning path offered by dbt Labs.

The goal is to document all progress, hands-on projects, and notes throughout the 5 milestones of the certification track.

---

## 📋 Learning Path

### Milestone 1 — dbt Fundamentals

| #   | Course           | Status | Certificate                                                                                            |
| --- | ---------------- | ------ | ------------------------------------------------------------------------------------------------------ |
| 1   | dbt Fundamentals | ✅     | [🔗 View credential](https://credentials.getdbt.com/23bd27af-631d-4592-8859-a55a248c7225#acc.LJ3k7UdE) |

> Core dbt concepts: models, sources, tests, documentation, and deployment.

### Milestone 2 — Jinja, Macros, and Packages

| #   | Course                      | Status |
| --- | --------------------------- | ------ |
| 2   | Jinja, Macros, and Packages | ⬜     |

> Jinja templating, custom macros, and community packages.

### Milestone 3 — Advanced dbt Techniques

| #   | Course                         | Status |
| --- | ------------------------------ | ------ |
| 3   | Refactoring SQL for Modularity | ⬜     |
| 4   | Incremental Models             | ⬜     |
| 5   | Analyses and Seeds             | ⬜     |
| 6   | Exposures                      | ⬜     |
| 7   | Understanding State            | ⬜     |
| 8   | dbt Retry                      | ⬜     |
| 9   | dbt Mesh Intro                 | ⬜     |
| 10  | dbt Mesh                       | ⬜     |
| 11  | Advanced Testing               | ⬜     |
| 12  | Advanced Deployment            | ⬜     |
| 13  | dbt Clone                      | ⬜     |
| 14  | Grants                         | ⬜     |
| 15  | Python Models                  | ⬜     |

> Advanced techniques including incremental models, refactoring, dbt Mesh, advanced testing, and more.

### Milestone 4 — Exam Preparation

| #   | Course                          | Status |
| --- | ------------------------------- | ------ |
| 16  | Pro Tips for dbt Certifications | ⬜     |
| 17  | dbt Developer Exam Study Guide  | ⬜     |

> Preparation material and tips for the certification exam.

### Milestone 5 — Exam Registration

| #   | Course                                           | Status |
| --- | ------------------------------------------------ | ------ |
| 18  | Register dbt Analytics Engineering Certification | ⬜     |

> Official exam registration and completion.

---

## 📂 Repository Structure

```
dbt-developer-path/
├── assets/
│   └── certificates/          # Certificates badges
├── dbt-fundamentals/          # Hands-on project — Jaffle Shop
└── README.md
```

---

## 🛠️ Tech Stack

| Tool             | Purpose             |
| ---------------- | ------------------- |
| **dbt Core**     | Data transformation |
| **BigQuery**     | Data Warehouse      |
| **Git / GitHub** | Version control     |
| **VS Code**      | Development IDE     |

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/geovannicorsino/dbt-developer-path.git
cd dbt-developer-path/dbt-fundamentals

# Install dependencies
pip install -r requirements.txt

# Configure dbt profile (~/.dbt/profiles.yml)
# Run models
dbt run

# Run tests
dbt test
```

> ⚠️ BigQuery credentials must be configured via `gcloud auth application-default login`.

---

## 📚 Useful Resources

- 📖 [dbt Documentation](https://docs.getdbt.com/)
- 🎓 [dbt Learn — Learning Path](https://learn.getdbt.com/learn/learning-path/dbt-certified-developer)
- 💬 [dbt Community (Slack)](https://community.getdbt.com/)
- 📝 [dbt Discourse](https://discourse.getdbt.com/)
- 🧪 [dbt Packages Hub](https://hub.getdbt.com/)

---

## 📄 License

This project is for educational purposes as part of the dbt certification learning path.
