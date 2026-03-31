<div align="center">

# 🟡 Milestone 2: Jinja, Macros, and Packages

<p align="center">
  Hands-on project focused on implementing <strong>Jinja templating</strong>, custom <strong>macros</strong>, and community <strong>packages</strong> in a dbt project.
</p>

[![dbt Badge](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](#)
[![Jinja Badge](https://img.shields.io/badge/Jinja-B41717?style=for-the-badge&logo=jinja&logoColor=white)](#)

</div>

---

## 🎯 Overview

This repository section corresponds to the second milestone of the **dbt Analytics Engineering Certification** learning path. The focus here is scaling out dbt projects by applying DRY (Don't Repeat Yourself) principles through Jinja and Macros, and leveraging the open-source community via dbt packages.

### 🔑 Key Concepts Addressed:
1. **Jinja Templating:** Using `if` statements, `for` loops, and dictionaries to write dynamic SQL (e.g., pivoting rows to columns).
2. **Custom Macros:** Creating reusable snippets of SQL logic like `convert_cents_to_dollars` and `format_currency`.
3. **dbt Packages:** Installing and applying the `dbt-labs/dbt_utils` package to leverage community-maintained macros like `generate_surrogate_key` and other utilities.

---

## 📂 Project Structure

```text
📦 jinja_macros_and_packages
 ┣ 📂 macros                  # Custom macros
 ┃ ┣ 📜 convert_cents_to_dollars.sql
 ┃ ┣ 📜 format_currency.sql
 ┃ ┗ 📜 properties.yml        # Macro documentation
 ┣ 📂 models                  # dbt models
 ┃ ┣ 📂 templates             # Jinja practice models (if, for, dicts, pivots)
 ┃ ┣ 📜 stg_sales.sql         # Staging model using custom macros
 ┃ ┗ 📜 stg_sales_utils.sql   # Staging model using dbt_utils
 ┣ 📜 packages.yml            # dbt packages configuration (dbt_utils)
 ┣ 📜 dbt_project.yml         # Project configuration
 ┗ 📜 README.md
```

---

## 🚀 Getting Started

Follow these steps to run the models in this milestone:

```bash
# 1. Navigate to the project directory
cd dbt-developer-path/jinja_macros_and_packages

# 2. Install dependencies (dbt packages)
dbt deps

# 3. Run the dbt models
dbt run

# 4. Review the generated SQL (in the target/ folder)
# This is especially useful for seeing how Jinja templates compile into raw SQL.
```

---

## 🧠 What We Built

* **Jinja Templates (`models/templates/`):** We explored how to use standard Jinja elements like `for_if.sql` and `pivoted.sql` to dynamically generate aggregations.
* **Reusable Data Transformations (`macros/`):** Moving repeated formula logic (like formatting currency or converting granular units) into callable functions.
* **Community Tools (`packages.yml`):** Relying on `dbt_utils` to quickly implement best practices like surrogate keys.

<br>

<div align="center">
  <p><i>Building robust, DRY data pipelines with dbt.</i></p>
</div>
