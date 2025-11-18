-- - Final Project 
CREATE DATABASE blinkit_db;
USE blinkit_db;

SELECT * 
FROM marketing_main;

-- Adding the right calcilation of ROAS and evaluation 

CREATE TABLE new_roas AS
SELECT *,
ROUND((revenue_generated - spend), 2) as spent_difference,
ROUND((revenue_generated / spend), 2)as ROAS_recalculated, 
 CASE 
 WHEN (revenue_generated / spend) < 1 THEN 'negative'
 WHEN (revenue_generated / spend) > 1 THEN 'positive'
 else 'equal 1'
 END as recalculated
FROM marketing_main;

select *
from new_roas; 

-- EVALUATION OF: Campaigns 
 -- Part 1:  General campaigns overview
 
  SELECT 
    campaign_name, 
    ROUND(COUNT(campaign_id),2) AS campaign_count, 
    ROUND(SUM(impressions),2) AS total_impressions, 
    ROUND(SUM(clicks),2) AS total_clicks, 
    ROUND(SUM(conversions),2) AS total_conversions, 
	ROUND(SUM(clicks) / SUM(impressions), 2) AS click_impr_ratio,
    ROUND(SUM(conversions) / SUM(clicks), 2) AS click_conversion_ratio,
	ROUND(SUM(conversions) / SUM(impressions), 2) AS impr_conversion_ratio,
    ROUND(SUM(spend),2) AS total_spend, 
   ROUND(SUM(revenue_generated),2) AS total_revenue, 
    ROUND(SUM(spent_difference),2) AS total_spent_diff,
    ROUND(SUM(revenue_generated) - SUM(spend),2) AS calculated_diff,
    ROUND(SUM(revenue_generated) / SUM(spend), 2) AS ROAS_grouped
FROM new_roas
GROUP BY 
    campaign_name;
    
-- PART 2: Preparation for Tableu csv extract (with date)
SELECT 
    campaign_name, 
    ROUND(COUNT(campaign_id),2) AS campaign_count, 
    ROUND(SUM(impressions),2) AS total_impressions, 
    ROUND(SUM(clicks),2) AS total_clicks, 
	ROUND(SUM(clicks) / SUM(impressions), 2) AS click_impr_ratio,
    ROUND(SUM(conversions) / SUM(clicks), 2) AS click_conversion_ratio,
	ROUND(SUM(conversions) / SUM(impressions), 2) AS impr_conversion_ratio,
	ROUND(SUM(conversions),2) AS total_conversions, 
    ROUND(SUM(spend),2) AS total_spend, 
    ROUND(SUM(revenue_generated),2) AS total_revenue, 
    ROUND(SUM(spent_difference),2) AS total_spent_diff,
    ROUND(SUM(revenue_generated) - SUM(spend),2) AS calculated_diff,
    ROUND(SUM(revenue_generated) / SUM(spend), 2) AS ROAS_grouped
FROM new_roas
GROUP BY 
    campaign_name,
    DATE(date)
ORDER BY 
    campaign_name,
    DATE(date);
    #

-- EVALUATION OF: Channels 
 -- Part 1:  General channels overview

SELECT 
    channel,
    ROUND(SUM(impressions), 2) AS total_impressions,
    ROUND(SUM(clicks), 2) AS total_clicks,
    ROUND(SUM(conversions), 2) AS total_conversions,
    ROUND(SUM(spend), 2) AS total_spent,
    ROUND(SUM(revenue_generated), 2) AS total_revenue,
    ROUND(SUM(revenue_generated) / NULLIF(SUM(spend), 0), 2) AS roas_total,
    ROUND((SUM(revenue_generated) / NULLIF(SUM(spend), 0)) * 100.0 / SUM(SUM(revenue_generated) / NULLIF(SUM(spend), 0)) OVER (), 2) AS roas_relative_weight
FROM marketing_main
GROUP BY channel
ORDER BY roas_relative_weight DESC;

-- PART 2: Preparation for Tableu csv extract (with date)

SELECT 
    channel,
    DATE(date),
    ROUND(SUM(impressions), 2) AS total_impressions,
    ROUND(SUM(clicks), 2) AS total_clicks,
    ROUND(SUM(conversions), 2) AS total_conversions,
    ROUND(SUM(clicks) / SUM(impressions), 2) AS click_impr_ratio,
    ROUND(SUM(conversions) / SUM(clicks), 2) AS click_conversion_ratio,
	ROUND(SUM(conversions) / SUM(impressions), 2) AS impr_conversion_ratio,
    ROUND(SUM(spend), 2) AS total_spent,
    ROUND(SUM(revenue_generated), 2) AS total_revenue,
    ROUND(SUM(revenue_generated) / NULLIF(SUM(spend), 0), 2) AS roas_total
FROM marketing_main
GROUP BY channel, DATE(date);


-- EVALUATION OF: Target audience  
 -- Part 1:  General Target audience  overview
 
 SELECT  target_audience, SUM(impressions), SUM(clicks), SUM(conversions), SUM(spend), SUM(revenue_generated), ROUND(SUM(revenue_generated) / SUM(spend), 2) as roas_recalculated
 FROM marketing_main
 GROUP BY target_audience; 
 
 
 -- PART 2: Preparation for Tableu csv extract (with date)
 SELECT  target_audience, DATE(date), SUM(impressions), SUM(clicks), SUM(conversions), SUM(spend), SUM(revenue_generated), ROUND(SUM(revenue_generated) / SUM(spend), 2) as roas_recalculated
 FROM marketing_main
 GROUP BY target_audience, DATE(date); 
 
 -- PART 3: Preparation for Tableua csv extract - target audeince x channel (with date)
SELECT 
target_audience, 
channel,
 DATE(date),
ROUND(SUM(impressions), 2) AS total_impressions,
    ROUND(SUM(clicks), 2) AS total_clicks,
    ROUND(SUM(clicks)/SUM(impressions), 2) AS click_impr_ratio,
    ROUND(SUM(conversions), 2) AS total_conversions,
	ROUND(SUM(clicks)/SUM(conversions), 2) AS click_convertion_ratio,
	ROUND(SUM(conversions)/SUM(impressions), 2) AS impr_convertion_ratio,
    ROUND(SUM(spend), 2) AS total_spent,
    ROUND(SUM(revenue_generated), 2) AS total_revenue,
    ROUND(SUM(revenue_generated) / NULLIF(SUM(spend), 0), 2) AS roas_total 
FROM marketingcsv
GROUP BY target_audience, channel, DATE(date);



 
