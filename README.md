# Analytics Engineering Foundations
**Mission:** Transforming raw data into high-integrity production intelligence to drive cash flow and attribution.

> [!IMPORTANT]
> **Engineering Philosophy: Depth Over Volume**
> I prioritize **Rationale** over raw output. 
Aiming to engineer and document solutions through a lifecycle of: 
    1. **Functional Solve** 
    2. **Edge-Case Stress Testing** (Ties/NULLs) 
    3. **Professional Refactor** (Window Functions/CTEs).

### 01. NYC Taxi Churn Prevention 
Identify high-value passengers at risk of churn  
**Tech**: BigQuery + dbt + Advanced SQL  
**Impact**: $2M annual revenue recovery opportunity  
[📁 Code](01-nyc-taxi-dbt/) | [📊 Results](01-nyc-taxi-dbt/data/)

### 02. E-commerce SaaS Metrics 
Build LTV/CAC/cohort analysis platform  
**Tech**: dbt Semantic Layer + Tests + Python loader  
**Impact**: Self-serve executive dashboard (2 week build)  
[📁 Code](02-ecom-cohorts/)

### 03. Regime Signals and return stats
**Problem**: Market regime detection → Trading signals  
**Tech**: Airbyte → BigQuery → dbt → Evidence.dev  
**Status**: WIP - Production pipeline  
[📁 Code](03-regime-signals/)

## Technical Foundation
- **50 LeetCode SQL** (Medium/Hard window functions, CTEs, pivots): [sql/leetcode/](sql/leetcode/)
- **dbt**: Models, tests, schema.yml, incremental loads
- **BigQuery**: Cost optimization, clustering, materialized views


