# Semantic View Descriptions

## Overview
This document provides detailed descriptions of all semantic views created for the Ridesharing Company Snowflake Intelligence demo. These views are optimized for natural language querying and provide pre-calculated metrics for common business questions.

---

## RIDESHARE_ANALYTICS_VIEW

### Purpose
Comprehensive analytical view that combines ride, client, and driver data with time-based analysis fields. This is the primary view for most analytical queries.

### Key Features
- **Grain**: One row per ride
- **Historical Range**: All rides since inception
- **Update Frequency**: Real-time (based on source tables)

### Field Categories

#### Client Dimension
- `CLIENT_ID`: Unique identifier for the client
- `CLIENT_NAME`: Name of school district, agency, or family
- `CLIENT_TYPE`: Type of client (School District, Agency, Direct Family)
- `CLIENT_STATE`: State where client is located
- `CLIENT_CITY`: City where client is located
- `CLIENT_SIGN_UP_DATE`: When client first signed up
- `CLIENT_STATUS`: Current status (Active, Inactive, Churned)
- `MONTHLY_BUDGET`: Client's monthly budget allocation

#### Ride Dimension
- `RIDE_ID`: Unique identifier for the ride
- `RIDE_DATE`: Date of the ride
- `RIDE_TIME`: Time of day for the ride
- `STUDENT_TYPE`: Category of student (General, Special Needs, McKinney-Vento, Foster Care)
- `RIDE_COST`: Cost of the ride in dollars
- `RIDE_STATUS`: Status of ride (Completed, Cancelled, No-Show)
- `CANCELLATION_REASON`: Reason for cancellation (if applicable)
- `REQUEST_TIMESTAMP`: When ride was requested
- `CONFIRMATION_TIMESTAMP`: When ride was confirmed
- `WAIT_TIME_MINUTES`: Time between request and confirmation
- `PICKUP_LAT`, `PICKUP_LON`: Pickup location coordinates
- `DROPOFF_LAT`, `DROPOFF_LON`: Dropoff location coordinates

#### Driver Dimension
- `DRIVER_ID`: Unique identifier for the CareDriver
- `DRIVER_NAME`: Name of the CareDriver
- `DRIVER_STATE`: State where driver operates
- `DRIVER_CITY`: City where driver operates
- `DRIVER_SIGN_UP_DATE`: When driver signed up
- `CERTIFICATION_COMPLETE_DATE`: When driver completed 15-point certification
- `CERTIFICATION_DAYS`: Number of days to complete certification
- `DRIVER_STATUS`: Current driver status (Active, Inactive, In Training)
- `DRIVER_MARKETING_SOURCE`: How driver was acquired (Social Media, Email, Referral, Direct)

#### Time Intelligence Fields
- `RIDE_YEAR`: Year of the ride
- `RIDE_QUARTER`: Quarter of the ride (1-4)
- `RIDE_MONTH`: Month number (1-12)
- `RIDE_MONTH_NAME`: Month name (January, February, etc.)
- `RIDE_MONTH_START`: First day of the ride month (useful for grouping)
- `RIDE_QUARTER_START`: First day of the ride quarter
- `RIDE_DAY_OF_WEEK`: Day of week (0=Sunday, 6=Saturday)
- `RIDE_HOUR`: Hour of day (0-23)

#### Calculated Categories
- `RIDE_TIME_CATEGORY`: 
  - Morning Rush (6 AM - 9 AM)
  - Afternoon Rush (2 PM - 5 PM)
  - Off-Peak (all other times)
  
- `WAIT_TIME_CATEGORY`:
  - Fast (≤10 minutes)
  - Moderate (10-20 minutes)
  - Slow (20-30 minutes)
  - Very Slow (>30 minutes)

- `FISCAL_YEAR`: Fiscal year (starts in July)
- `CLIENT_TENURE_MONTHS`: Months since client signed up
- `DRIVER_TENURE_DAYS`: Days since driver signed up

### Common Use Cases
1. Analyzing ride volume by client and geography
2. Tracking ride patterns by time of day and day of week
3. Monitoring wait times and operational efficiency
4. Understanding student type distribution
5. Correlating driver acquisition source with performance

---

## FEEDBACK_ANALYTICS_VIEW

### Purpose
Dedicated view for analyzing rider feedback and sentiment with full client and driver context.

### Key Features
- **Grain**: One row per feedback entry
- **Rating Scale**: 1.0 to 5.0
- **Sentiment Categories**: Positive, Neutral, Negative

### Field Categories

#### Feedback Metrics
- `FEEDBACK_ID`: Unique identifier for feedback
- `RIDE_ID`: Associated ride identifier
- `FEEDBACK_DATE`: When feedback was provided
- `RATING`: Numeric rating (1.0-5.0)
- `COMMENTS`: Text feedback from rider/family
- `SENTIMENT`: Overall sentiment classification

#### Context Fields
- Client information (ID, name, type, state, city)
- Driver information (ID, name, state, city)
- Time period fields (year, month, month name, month start)

#### Calculated Categories
- `RATING_CATEGORY`:
  - Excellent (≥4.5)
  - Good (≥3.5)
  - Fair (≥2.5)
  - Poor (<2.5)

### Common Use Cases
1. Tracking average ratings by driver
2. Identifying negative feedback trends
3. Analyzing sentiment by geographic region
4. Monitoring feedback volume over time
5. Correlating ratings with ride characteristics

---

## MARKETING_ANALYTICS_VIEW

### Purpose
Comprehensive view for marketing campaign performance analysis and ROI calculations.

### Key Features
- **Grain**: One row per campaign result metric
- **ROI Metric**: Pre-calculated ROAS (Return on Ad Spend)
- **Campaign Types**: CareDriver Recruitment, Client Acquisition, Brand Awareness

### Field Categories

#### Campaign Details
- `CAMPAIGN_ID`: Unique campaign identifier
- `CAMPAIGN_NAME`: Name of the campaign
- `CAMPAIGN_TYPE`: Type of campaign
- `CHANNEL`: Marketing channel (Social Media, Email, Search, Display)
- `CAMPAIGN_START_DATE`: Campaign start date
- `CAMPAIGN_END_DATE`: Campaign end date
- `AD_SPEND`: Total advertising spend
- `TARGET_AUDIENCE`: Target audience (Drivers, Schools, Families)

#### Performance Metrics
- `RESULT_ID`: Unique result identifier
- `METRIC_TYPE`: Type of metric (Driver Signups, Client Signups, Leads, Revenue)
- `METRIC_VALUE`: Numeric value of the metric
- `RESULT_DATE`: Date of the result
- `GEOGRAPHIC_MARKET`: Market where result occurred

#### Calculated Fields
- `CAMPAIGN_YEAR`: Year campaign started
- `CAMPAIGN_QUARTER`: Quarter campaign started
- `CAMPAIGN_START_MONTH`: Month name when campaign started
- `CAMPAIGN_DURATION_DAYS`: Length of campaign in days
- `ROAS`: Return on Ad Spend (Revenue / Ad Spend)

### Common Use Cases
1. Calculating campaign ROI and ROAS
2. Comparing performance across channels
3. Analyzing driver acquisition costs
4. Geographic market performance analysis
5. Campaign efficiency trending

---

## DRIVER_PERFORMANCE_VIEW

### Purpose
Aggregated view of individual driver performance metrics for operational analysis.

### Key Features
- **Grain**: One row per driver
- **Aggregation Period**: All-time metrics
- **Performance Indicators**: Rides, revenue, ratings, efficiency

### Field Categories

#### Driver Information
- Core driver fields (ID, name, location, dates, status, marketing source)
- Certification metrics (completion date, days to complete)

#### Ride Metrics
- `TOTAL_RIDES`: Total number of rides
- `COMPLETED_RIDES`: Successfully completed rides
- `CANCELLED_RIDES`: Cancelled rides
- `NO_SHOW_RIDES`: No-show rides

#### Revenue Metrics
- `TOTAL_REVENUE`: Total revenue generated
- `AVG_RIDE_COST`: Average cost per completed ride

#### Quality Metrics
- `AVG_RATING`: Average feedback rating
- `TOTAL_FEEDBACK`: Number of feedback entries

#### Efficiency Metrics
- `RIDES_PER_WEEK`: Average rides per week since certification

### Common Use Cases
1. Identifying top-performing drivers
2. Monitoring driver quality scores
3. Analyzing driver productivity
4. Comparing acquisition channels
5. Tracking certification process efficiency

---

## CLIENT_PERFORMANCE_VIEW

### Purpose
Aggregated view of client performance metrics for sales and account management.

### Key Features
- **Grain**: One row per client
- **Aggregation Period**: All-time metrics
- **Key Metrics**: Volume, spend, student types, completion rates

### Field Categories

#### Client Information
- Core client fields (ID, name, type, location, dates, status, budget)

#### Ride Volume Metrics
- `TOTAL_RIDES`: Total number of rides requested
- `COMPLETED_RIDES`: Successfully completed rides

#### Student Type Breakdown
- `SPECIAL_NEEDS_RIDES`: Rides for special needs students
- `MCKINNEY_VENTO_RIDES`: Rides for homeless students
- `FOSTER_CARE_RIDES`: Rides for foster care students
- `GENERAL_RIDES`: Rides for general students

#### Financial Metrics
- `TOTAL_SPEND`: Total amount spent (all-time)
- `AVG_RIDE_COST`: Average cost per completed ride
- `CURRENT_MONTH_SPEND`: Spend in current month

#### Performance Metrics
- `COMPLETION_RATE`: Percentage of rides completed
- `AVG_WAIT_TIME_MINUTES`: Average wait time for confirmation

#### Timeline Fields
- `FIRST_RIDE_DATE`: Date of first ride
- `LAST_RIDE_DATE`: Date of most recent ride

### Common Use Cases
1. Identifying top clients by volume and spend
2. Analyzing client portfolios by student type
3. Monitoring account health metrics
4. Tracking spend against budget
5. Identifying upsell opportunities

---

## LEAD_CONVERSION_VIEW

### Purpose
View for analyzing lead generation and conversion effectiveness.

### Key Features
- **Grain**: One row per lead
- **Conversion Tracking**: Binary conversion status and timing
- **Attribution**: Marketing source tracking

### Field Categories

#### Lead Information
- `LEAD_ID`: Unique lead identifier
- `LEAD_NAME`: Name of potential client
- `LEAD_TYPE`: Type of lead (School District, Agency, Family)
- `STATE`: State location
- `CITY`: City location
- `LEAD_DATE`: When lead was generated
- `MARKETING_SOURCE`: How lead was acquired

#### Conversion Metrics
- `CONVERTED_TO_CLIENT`: Boolean - whether lead converted
- `CONVERSION_DATE`: When conversion occurred
- `IS_CONVERTED`: Numeric flag (1 or 0) for easy aggregation
- `DAYS_TO_CONVERSION`: Time from lead to conversion

#### Time Period Fields
- `LEAD_YEAR`: Year lead was generated
- `LEAD_QUARTER`: Quarter lead was generated
- `LEAD_MONTH`: Month number
- `LEAD_MONTH_NAME`: Month name

### Common Use Cases
1. Calculating conversion rates by source
2. Analyzing geographic conversion patterns
3. Understanding conversion timelines
4. Comparing marketing source effectiveness
5. Forecasting pipeline conversion

---

## Best Practices for Using These Views

### Performance Optimization
1. **Use the right view for your question**: Don't use RIDESHARE_ANALYTICS_VIEW when a pre-aggregated view (like CLIENT_PERFORMANCE_VIEW) will suffice
2. **Filter early**: Apply date and geography filters to reduce data volume
3. **Leverage pre-calculated fields**: Use fields like FISCAL_YEAR, RIDE_MONTH_START instead of calculating them

### Data Quality
1. **Check for NULL values**: Some drivers may not have certification completion dates (still in training)
2. **Validate status fields**: Filter by CLIENT_STATUS='Active' for current clients
3. **Consider date ranges**: Always be explicit about time periods in analysis

### Common Join Patterns
```sql
-- Combining feedback with rides
SELECT *
FROM RIDESHARE_ANALYTICS_VIEW r
LEFT JOIN FEEDBACK_ANALYTICS_VIEW f 
  ON r.RIDE_ID = f.RIDE_ID

-- Driver performance with marketing attribution
SELECT *
FROM DRIVER_PERFORMANCE_VIEW d
LEFT JOIN MARKETING_CAMPAIGNS m 
  ON d.MARKETING_SOURCE = m.CHANNEL
  AND d.SIGN_UP_DATE BETWEEN m.START_DATE AND m.END_DATE
```

### Time Period Calculations
- **Last 6 months**: `WHERE RIDE_DATE >= DATEADD(month, -6, CURRENT_DATE())`
- **Last quarter**: `WHERE RIDE_QUARTER_START = DATEADD(quarter, -1, DATE_TRUNC('quarter', CURRENT_DATE()))`
- **Current fiscal year**: `WHERE FISCAL_YEAR = (CASE WHEN MONTH(CURRENT_DATE()) >= 7 THEN YEAR(CURRENT_DATE()) ELSE YEAR(CURRENT_DATE()) - 1 END)`
