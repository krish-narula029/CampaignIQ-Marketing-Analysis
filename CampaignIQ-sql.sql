SELECT * FROM campaign_iq.campaign_iq_cleaned;

select * from campaign_iq_cleaned limit 10;
describe campaign_iq_cleaned;
select count(*) as total_campaigns, sum(spend) as total_spend, sum(impressions) as total_impressions, sum(clicks) as total_clicks,
sum(conversions) as total_conversions, sum(revenue) as total_revenue from campaign_iq_cleaned;

select sum(clicks) / sum(impressions) * 100 as CTR_percent, sum(conversions) / sum(clicks) * 100 as conversion_rate_percent,
sum(revenue) / sum(spend) AS ROAS
from campaign_iq_cleaned;

select count(*) as total_campaigns, sum(spend) as total_spend, sum(impressions) as total_impressions, sum(clicks) as total_clicks,
 sum(conversions) as total_conversions, sum(revenue) as total_revenue, 
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_percent,
 round(sum(conversions) / nullif(sum(clicks),0) * 100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0),2) as ROAS from campaign_iq_cleaned
 order by ROAS desc;
 
 select spend, revenue, conversions, ROAS from campaign_iq_cleaned order by ROAS desc limit 10;
 select spend,conversions, revenue, ROAS from campaign_iq_cleaned order by revenue desc limit 10;
 select spend, clicks, conversions, revenue, ROAS from campaign_iq_cleaned order by conversions desc limit 10;
 select round(avg(cpc),2) as avg_cpc, 
 round(avg(cpa),2) as avg_cpa,
 round(avg(cpa),2) as avg_cpa,
 round(avg(ROAS),2) as avg_ROAS,
 round(min(cpc),2) as min_cpc,
 round(max(cpa),2) as max_cpa
 from campaign_iq_cleaned;
 
 select spend,revenue,conversions,CPA,ROAS from campaign_iq_cleaned where spend > ( select avg(spend) from campaign_iq_cleaned)
 and ROAS < 1 order by spend desc limit 10;
 
 select * from campaign_iq_cleaned limit 1;
 select * from campaign_iq_cleaned_full limit 10;
 select count(*) as total_rows from campaign_iq_cleaned_full;
 
 describe campaign_iq_cleaned_full;
 select distinct ad_name from campaign_iq_cleaned_full limit 20;
 select ad_name,count(*) as campaigns, sum(spend) as total_spend, sum(clicks) as total_clicks, sum(conversions) as total_conversions,
 round(sum(revenue),2) as total_revenue,round(sum(revenue) / nullif(sum(spend),0),2) as ROAS
 from campaign_iq_cleaned_full group by ad_name order by ROAS desc;
 
 select ad_name, round(sum(spend),2) as total_spend,sum(conversions) as total_conversions, 
 round(sum(revenue),2) as total_revenue,round(sum(revenue) / nullif(sum(spend),0),2) as ROAS
 from campaign_iq_cleaned_full group by ad_name having ROAS < 1 order by total_spend desc limit 10;
 
 select ad_name,sum(spend) as total_spend, sum(clicks) as total_clicks, sum(conversions) as total_conversions,
 round(sum(revenue),2) as total_revenue, round(sum(revenue) / nullif (sum(spend),0),2) as ROAS
 from campaign_iq_cleaned_full group by ad_name order by total_conversions desc limit 10;
 
 select count(*) as total_rows, round(sum(spend),2) as total_spend, sum(impressions) as total_impressions,sum(clicks) as total_clicks,
 sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue, 
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) * 100,2) as  conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) * 100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0),2) as ROAS
 from campaign_iq_cleaned_full;
 
 select year,month,month_name,count(*) as campaigns, round(sum(spend),2) as total_spend,sum(impressions) as total_impressions,
 sum(clicks) as total_clicks,sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue,
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) *100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) ,2) as ROAS
 from campaign_iq_cleaned_full
 group by year,month,month_name
 order by year,month;
 
 select platform,count(*) as campaigns, round(sum(spend),2) as total_spend,sum(impressions) as total_impressions,
 sum(clicks) as total_clicks,sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue,
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) *100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) ,2) as ROAS
 from campaign_iq_cleaned_full
 group by platform
 order by ROAS;
 
 select day_of_week,count(*) as campaigns, round(sum(spend),2) as total_spend,sum(impressions) as total_impressions,
 sum(clicks) as total_clicks,sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue,
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) *100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) ,2) as ROAS
 from campaign_iq_cleaned_full
 group by day_of_week
 order by ROAS desc;
 
  select post_hour,count(*) as campaigns, round(sum(spend),2) as total_spend,
 sum(clicks) as total_clicks,sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue,
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) *100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) ,2) as ROAS
 from campaign_iq_cleaned_full
 group by post_hour
 order by ROAS desc;
 
 select campaign_name,count(*) as records, round(sum(spend),2) as total_spend,
 sum(clicks) as total_clicks,sum(conversions) as total_conversions, round(sum(revenue),2) as total_revenue,
 round(sum(clicks) / nullif(sum(impressions),0) * 100,2) as CTR_Percent,
 round(sum(conversions) / nullif(sum(clicks),0) *100,2) as conversion_rate_percent,
 round(sum(revenue) / nullif(sum(spend),0) ,2) as ROAS
 from campaign_iq_cleaned_full
 group by campaign_name
 order by ROAS desc;
 
 select platform,day_of_week,count(*) as campaigns,round(sum(spend),2) as total_spend,sum(clicks) as total_sales,
 sum(conversions) as total_conversion, round(sum(revenue),2) as total_revenue,round(sum(revenue) / nullif(sum(spend),0),2) as ROAS
 from campaign_iq_cleaned_full
 group by platform, day_of_week
 order by ROAS desc
 limit 20;
 
 select campaign_name, sum(spend) as spend, sum(revenue) as revenue,round(sum(revenue)/sum(spend),2) as ROAS
  from campaign_iq_cleaned_full group by campaign_name having ROAS < 1 order by spend desc limit 10;
  
select campaign_name, sum(spend) as spend, sum(revenue) as revenue,round(sum(revenue)/sum(spend),2) as ROAS
  from campaign_iq_cleaned_full group by campaign_name order by ROAS desc limit 10;
  
  select count(*) as total_rows, round(sum(spend),2) as total_spend, sum(clicks) as total_clicks, sum(conversions) as total_conversions,
  round(sum(revenue),2) as total_revenue,round(sum(clicks) / sum(impressions) * 100, 2) as CTR,
  round(sum(conversions) / sum(clicks)*100, 2) as conversion_rate,
  round(sum(revenue) / sum(spend),2) as ROAS
  from campaign_iq_cleaned_full;