<div align="center">

# 🔵 Milestone 3: dbt Mesh — Multi-Project Setup

<p align="center">
  Hands-on project demonstrating a <strong>dbt Mesh</strong> architecture, where multiple independent dbt projects communicate through cross-project references — simulating a real-world multi-team data platform.
</p>

[![dbt Badge](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](#)
[![Google BigQuery Badge](https://img.shields.io/badge/BigQuery-669DF6?style=for-the-badge&logo=google-bigquery&logoColor=white)](#)

</div>

---

## 🎯 Overview

This section of the learning path covers **dbt Mesh**, dbt Labs' approach to scaling analytics engineering across multiple teams. Instead of one monolithic dbt project, each team owns their own project, exposing only curated **public models** as a stable API for other teams to consume.

### 🔑 Key Concepts Addressed:

1. **Cross-Project References:** Using two-argument `ref('project', 'model')` to reference models across project boundaries.
2. **Public Models & Contracts:** Declaring `access: public` and `contract: enforced: true` so downstream teams can rely on a stable, typed schema.
3. **`dependencies.yml` vs `packages.yml`:** Understanding when each file applies — dbt Cloud Discovery API vs. local dbt Core development.
4. **Deferral (`--defer --state`):** Simulating true Mesh behavior locally by pointing dbt Core to an upstream project's `manifest.json`.

---

## 🏗️ Architecture

```text
dbt_mesh_multi_project/
│
├── data_engineering/     ← 🔼 Upstream   │ Seeds + public staging models
├── ecommerce/            ← 🔽 Downstream │ Ecommerce team marts
└── growth_products/      ← 🔽 Downstream │ Growth & new products team marts
```

> Open `assets/mesh_lineage.excalidraw` in [Excalidraw](https://excalidraw.com) or the VS Code extension to visualize the full lineage.

---

## 📂 Project Structure

```text
📦 dbt_mesh_multi_project
 ┣ 📂 data_engineering          # Upstream producer
 ┃ ┣ 📂 seeds                   # 6 raw CSV sources
 ┃ ┣ 📂 models/staging          # 6 public staging views (access: public)
 ┃ ┗ 📜 dbt_project.yml
 ┣ 📂 ecommerce                 # Downstream consumer — ecommerce team
 ┃ ┣ 📂 models/marts            # fct_orders, fct_order_items, dim_customers, dim_stores
 ┃ ┣ 📜 dependencies.yml        # ☁️  dbt Cloud only — commented out for local dev
 ┃ ┣ 📜 packages.yml            # 🖥️  Local dev — installs data_engineering as package
 ┃ ┗ 📜 dbt_project.yml
 ┣ 📂 growth_products           # Downstream consumer — growth team
 ┃ ┣ 📂 models/marts            # dim_products, dim_product_supplies, fct_product_revenue
 ┃ ┣ 📜 dependencies.yml        # ☁️  dbt Cloud only — commented out for local dev
 ┃ ┣ 📜 packages.yml            # 🖥️  Local dev — installs data_engineering as package
 ┃ ┗ 📜 dbt_project.yml
 ┗ 📜 README.md
```

---

## 🚀 Getting Started (dbt Core)

> **Prerequisite:** BigQuery credentials configured via `gcloud auth application-default login`.

### Step 1 — Build the upstream project

```bash
cd data_engineering

dbt seed   # Loads 6 CSVs into BigQuery (data_engineering dataset)
dbt run    # Builds 6 public staging views
```

### Step 2 — Build the `ecommerce` project

```bash
cd ../ecommerce

dbt deps   # Installs data_engineering as a local package
dbt run --select "path:models/marts/" --defer --state ../data_engineering/target
```

### Step 3 — Build the `growth_products` project

```bash
cd ../growth_products

dbt deps   # Installs data_engineering as a local package
dbt run --select "path:models/marts/" --defer --state ../data_engineering/target
```

> **Why `--defer --state`?**
> The `--defer` flag reads the upstream `manifest.json` from `--state` and resolves cross-project `ref()` calls to the existing BigQuery tables — simulating true dbt Mesh behavior without dbt Cloud.

---

## 🧠 What We Built

* **Upstream API (`data_engineering`):** All 6 staging models are declared `access: public` with enforced schema contracts, providing a stable, typed interface for downstream teams.
* **Cross-Project `ref()`:** Both `ecommerce` and `growth_products` consume `data_engineering` models using `{{ ref('data_engineering', 'stg_ecommerce__orders') }}`, which compiles directly to the upstream BigQuery dataset.
* **Local Mesh Simulation:** Replaced the dbt Cloud-only `dependencies.yml > projects:` key with a `packages.yml` local install + `--defer` pattern, making the setup fully functional in dbt Core.

---

## ☁️ Running on dbt Cloud

On dbt Cloud, the `dependencies.yml` file handles cross-project resolution automatically via the **Discovery API** — no `packages.yml` or `--defer` needed.

To switch to dbt Cloud mode, uncomment the entry in each downstream project's `dependencies.yml`:

```yaml
# dependencies.yml
projects:
  - name: data_engineering
```

---

## 🗄️ BigQuery Datasets

| Project | BigQuery Dataset |
|---|---|
| `data_engineering` | `geovanni-corsino-labs.data_engineering` |
| `ecommerce` | `geovanni-corsino-labs.ecommerce` |
| `growth_products` | `geovanni-corsino-labs.growth_products` |

<br>

<div align="center">
  <p><i>Scaling analytics engineering across teams with dbt Mesh.</i></p>
</div>
