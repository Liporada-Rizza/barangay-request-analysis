# Barangay Service Request Analysis (April–September 2026)

**Project 2: Data / Database Project** · BSIT Industry-Ready Portfolio

An analysis of 217 barangay service requests to find the most common concerns, monthly trends, problem areas, resolution speed, and resident satisfaction. The same questions were answered in **Google Sheets** and **SQL (PostgreSQL on Supabase)**, and both gave the same results.

> ⚠️ **Data note:** This uses **simulated sample data** created for practice, modeled on my [Barangay Service Request System](https://github.com/Liporada-Rizza/barangay-service-request). It does not contain real residents or real barangay records.

## 🛠️ Tools Used
- **Google Sheets / Excel:** pivot tables, COUNTIF, COUNTIFS, AVERAGEIFS, charts
- **SQL (PostgreSQL / Supabase):** GROUP BY, COUNT, AVG, FILTER, CASE WHEN
- **Data cleaning:** removed blank rows from the pivot table range, added a month helper column

## 📁 Files
| File | Description |
|---|---|
| `barangay_requests_sample.csv` | Raw dataset (217 requests) |
| `Barangay_Request_Analysis.xlsx` | Analysis workbook with formulas, charts, and findings |
| `project2_sql_queries.sql` | SQL queries for the same analysis |
| `screen shot/` | Charts and SQL results |

## ❓ Questions and Findings
| # | Question | Finding |
|---|---|---|
| 1 | Which concern is reported the most? | **Garbage / Sanitation:** 63 of 217 requests (29%) |
| 2 | How do requests change per month? | Requests rose **44%** in the rainy months (Jul–Sep). July was the busiest (49) |
| 3 | Which zone has the most requests? | **Zone 3** (53). About half are garbage-related, and it has 43% of all garbage requests |
| 4 | Which category takes the longest to resolve? | **Road / Infrastructure:** 17.2 days on average (up to 25) |
| 5 | Does faster resolution mean happier residents? | Ratings stay around 3.1–3.2 up to 14 days, then **drop to 2.5** after 15+ days |

## 💡 Recommendations
1. Add garbage collection days, especially in **Zone 3**
2. Clear drainage and prepare road repairs **before the rainy season** (June)
3. Give estimated completion times and status updates for road repairs
4. Set a target to resolve or update every request **within 14 days**

## 📸 Screenshots
**Requests by Category (Google Sheets)**
![Category Chart](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/chart-category.png.png)

**Total Requests (data check)**
![SQL Total](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-total.png.png)

**SQL Results**
| Category | Monthly |
|---|---|
| ![SQL Category](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-category.png.png) | ![SQL Monthly](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-monthly.png.png) |

| Zone | Resolution Time |
|---|---|
| ![SQL Zone](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-zone.png.png) | ![SQL Resolution](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-resolution.png.png) |

**Satisfaction by Resolution Time**
![SQL Satisfaction](https://github.com/Liporada-Rizza/barangay-request-analysis/blob/main/screen%20shot/sql-satisfaction.png.png)

## ⚠️ Limitations
- Simulated data, so the patterns are realistic examples, not real barangay results
- Satisfaction ratings exist only for resolved requests (20 requests are still open)
- Six months of data only

## 👩‍💻 Developer
**Rizza Liporada** · BSIT Student, Datamex College of Saint Adeline
