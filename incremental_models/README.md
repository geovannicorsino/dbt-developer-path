<div align="center">

# 🔵 Milestone 3: Incremental Models

<p align="center">
  Hands-on project exploring <strong>Incremental Materialization</strong> strategies in dbt, focusing on performance optimization for large datasets.
</p>

[![dbt Badge](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](#)
[![BigQuery Badge](https://img.shields.io/badge/BigQuery-669DF6?style=for-the-badge&logo=google-bigquery&logoColor=white)](#)

</div>

---

## 🎯 Overview

This section of the learning path covers one of the most critical aspects of Analytics Engineering: **Incremental Models**. Instead of rebuilding tables from scratch, we only process new or changed data, significantly reducing warehouse costs and processing time.

### 🔑 Key Concepts Addressed:
1. **Incremental Logic:** Using the `is_incremental()` macro to filter for new data.
2. **Merge Strategy:** The default strategy that matches records by a `unique_key` and updates them.
3. **Insert Overwrite:** A high-performance strategy for BigQuery that replaces entire partitions (e.g., daily partitions) based on a partition column.
4. **Microbatch Strategy:** Implementing the latest dbt strategies for handling high-volume event streams efficiently.

---

## 📂 Project Structure

```text
📦 incremental_models
 ┣ 📂 models
 ┃ ┣ 📂 staging
 ┃ ┃ ┗ 📜 _src_events.yml          # Detailed event source definitions
 ┃ ┗ 📂 incremental_strategies     # Different implementation patterns
 ┃ ┃ ┣ 📜 incremental_merge.sql    # Standard merge pattern
 ┃ ┃ ┣ 📜 insert_overwrite.sql     # Partition-based overwrite (BigQuery)
 ┃ ┃ ┣ 📜 insert_microbatch.sql    # Advanced microbatching
 ┃ ┃ ┗ 📜 incremental_strategies.yml # Documentation and tests
 ┣ 📜 dbt_project.yml              # Project configuration
 ┗ 📜 README.md
```

---

## 🚀 Getting Started

To test these incremental strategies:

```bash
# 1. Navigate to the project directory
cd dbt-developer-path/incremental_models

# 2. Run the models for the first time (Full Refresh)
dbt run --select incremental_strategies

# 3. Simulate new data and run incrementally
# You can use --vars or just run again if the source has new data
dbt run --select incremental_strategies

# 4. Force a full refresh if needed
dbt run --full-refresh --select insert_overwrite
```

---

## 🧠 What We Built

* **Partitioned Overwrites:** Configured `insert_overwrite` with BigQuery's `partition_by` to replace only the necessary days of data, avoiding expensive full-table scans.
* **Unique Key Merges:** Ensured data integrity in `incremental_merge` by using `unique_key` to prevent duplicate records on updates.
* **Performance Tuning:** Learned how to choose the right strategy depending on the data volume and warehouse capabilities.

<br>

<div align="center">
  <p><i>Optimizing data pipelines for scale and efficiency.</i></p>
</div>
