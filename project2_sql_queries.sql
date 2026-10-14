-- =========================================================
-- Project 2: Barangay Service Request Analysis — SQL Queries
-- Database: Supabase (PostgreSQL)
-- Table: sample_requests (imported from barangay_requests_sample.csv)
-- Note: simulated sample data, April–September 2026
-- =========================================================

-- HOW TO LOAD THE DATA (Supabase dashboard):
-- Table Editor → New table → name it "sample_requests"
-- → "Import data from CSV" → choose barangay_requests_sample.csv → Save.
-- Make sure date_submitted and date_resolved are type "date",
-- and days_to_resolve and satisfaction_rating are type "int4".

-- Q0. Check that all rows were imported (expected: 217)
select count(*) as total_requests
from sample_requests;


-- Q1. Which concern is reported the most?
select
  category,
  count(*) as requests,
  round(100.0 * count(*) / (select count(*) from sample_requests), 1) as percent_of_total
from sample_requests
group by category
order by requests desc;


-- Q2. How do requests change per month?
select
  to_char(date_submitted, 'YYYY-MM') as month,
  count(*) as requests
from sample_requests
group by month
order by month;


-- Q2b. Dry season (Apr–Jun) vs rainy season (Jul–Sep) for rain-related concerns
select
  case when extract(month from date_submitted) between 4 and 6
       then 'Dry (Apr–Jun)' else 'Rainy (Jul–Sep)' end as season,
  count(*) as rain_related_requests
from sample_requests
where category in ('Garbage / Sanitation', 'Road / Infrastructure', 'Health')
group by season
order by season;


-- Q3. Which zone has the most requests, and how many are about garbage?
select
  zone,
  count(*) as total_requests,
  count(*) filter (where category = 'Garbage / Sanitation') as garbage_requests
from sample_requests
group by zone
order by total_requests desc;


-- Q4. Which category takes the longest to resolve?
select
  category,
  count(*) as resolved_requests,
  round(avg(days_to_resolve), 1) as avg_days_to_resolve,
  max(days_to_resolve) as longest_days
from sample_requests
where status = 'Resolved'
group by category
order by avg_days_to_resolve desc;


-- Q5. Does faster resolution mean happier residents?
select
  case
    when days_to_resolve <= 3  then '1–3 days'
    when days_to_resolve <= 7  then '4–7 days'
    when days_to_resolve <= 14 then '8–14 days'
    else '15+ days'
  end as resolution_time,
  count(*) as resolved_requests,
  round(avg(satisfaction_rating), 2) as avg_rating
from sample_requests
where status = 'Resolved'
group by resolution_time
order by min(days_to_resolve);


-- Q6. Requests still waiting for action
select status, count(*) as requests
from sample_requests
where status <> 'Resolved'
group by status;
