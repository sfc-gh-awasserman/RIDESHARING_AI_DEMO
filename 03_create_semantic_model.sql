-- Snowflake Intelligence Demo: Ridesharing Company
-- Step 3: Create Semantic Model using YAML Configuration

USE DATABASE RIDESHARE_DEMO;
USE SCHEMA RIDESHARE_DATA;

-- Create the semantic model using YAML configuration
CALL SYSTEM$CREATE_SEMANTIC_VIEW_FROM_YAML(
  'RIDESHARE_DEMO.RIDESHARE_DATA',
  $$
  name: RIDESHARE_ANALYTICS
  description: Comprehensive semantic model for ridesharing company operations covering sales, marketing, product, and operational performance for student transportation services
  tables:
    - name: CLIENTS
      description: School districts, agencies, and families using the ridesharing service
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: CLIENTS
      primary_key:
        columns:
          - CLIENT_ID
      dimensions:
        - name: CLIENT_ID
          description: Unique identifier for the client
          expr: clients.CLIENT_ID
          data_type: VARCHAR
        - name: CLIENT_NAME
          description: Name of the school district, agency, or family
          expr: clients.CLIENT_NAME
          data_type: VARCHAR
        - name: CLIENT_TYPE
          description: Type of client (School District, Agency, Direct Family)
          expr: clients.CLIENT_TYPE
          data_type: VARCHAR
        - name: CLIENT_STATE
          description: State where the client is located
          expr: clients.STATE
          data_type: VARCHAR
        - name: CLIENT_CITY
          description: City where the client is located
          expr: clients.CITY
          data_type: VARCHAR
        - name: CLIENT_SIGN_UP_DATE
          description: Date when the client first signed up
          expr: clients.SIGN_UP_DATE
          data_type: DATE
        - name: CLIENT_STATUS
          description: Current status of the client (Active, Inactive, Churned)
          expr: clients.STATUS
          data_type: VARCHAR
      facts:
        - name: CLIENT_MONTHLY_BUDGET
          description: Client's monthly budget allocation
          expr: clients.MONTHLY_BUDGET
          data_type: NUMBER

    - name: CARE_DRIVERS
      description: Certified drivers (CareDrivers) who provide student transportation services
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: CARE_DRIVERS
      primary_key:
        columns:
          - DRIVER_ID
      dimensions:
        - name: DRIVER_ID
          description: Unique identifier for the CareDriver
          expr: care_drivers.DRIVER_ID
          data_type: VARCHAR
        - name: DRIVER_NAME
          description: Name of the CareDriver
          expr: care_drivers.DRIVER_NAME
          data_type: VARCHAR
        - name: DRIVER_STATE
          description: State where the driver operates
          expr: care_drivers.STATE
          data_type: VARCHAR
        - name: DRIVER_CITY
          description: City where the driver operates
          expr: care_drivers.CITY
          data_type: VARCHAR
        - name: DRIVER_SIGN_UP_DATE
          description: Date when the driver signed up
          expr: care_drivers.SIGN_UP_DATE
          data_type: DATE
        - name: CERTIFICATION_COMPLETE_DATE
          description: Date when the driver completed the 15-point certification
          expr: care_drivers.CERTIFICATION_COMPLETE_DATE
          data_type: DATE
        - name: DRIVER_STATUS
          description: Current driver status (Active, Inactive, In Training)
          expr: care_drivers.STATUS
          data_type: VARCHAR
        - name: DRIVER_MARKETING_SOURCE
          description: Marketing source that acquired the driver (Social Media, Email, Referral, Direct)
          expr: care_drivers.MARKETING_SOURCE
          data_type: VARCHAR
      facts:
        - name: CERTIFICATION_DAYS
          description: Number of days taken to complete the certification process
          expr: care_drivers.CERTIFICATION_DAYS
          data_type: NUMBER

    - name: RIDES
      description: Individual ride transactions including student transportation details
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: RIDES
      primary_key:
        columns:
          - RIDE_ID
      dimensions:
        - name: RIDE_ID
          description: Unique identifier for the ride
          expr: rides.RIDE_ID
          data_type: VARCHAR
        - name: RIDE_DATE
          description: Date of the ride
          expr: rides.RIDE_DATE
          data_type: DATE
        - name: RIDE_TIME
          description: Time of day for the ride
          expr: rides.RIDE_TIME
          data_type: TIME
        - name: STUDENT_TYPE
          description: Category of student (General, Special Needs, McKinney-Vento, Foster Care)
          expr: rides.STUDENT_TYPE
          data_type: VARCHAR
        - name: RIDE_STATUS
          description: Status of the ride (Completed, Cancelled, No-Show)
          expr: rides.RIDE_STATUS
          data_type: VARCHAR
        - name: CANCELLATION_REASON
          description: Reason for ride cancellation if applicable
          expr: rides.CANCELLATION_REASON
          data_type: VARCHAR
        - name: REQUEST_TIMESTAMP
          description: Timestamp when the ride was requested
          expr: rides.REQUEST_TIMESTAMP
          data_type: TIMESTAMP
        - name: CONFIRMATION_TIMESTAMP
          description: Timestamp when the ride was confirmed
          expr: rides.CONFIRMATION_TIMESTAMP
          data_type: TIMESTAMP
      facts:
        - name: RIDE_COST
          description: Cost of the ride in dollars
          expr: rides.RIDE_COST
          data_type: NUMBER
        - name: WAIT_TIME_MINUTES
          description: Wait time between request and confirmation in minutes
          expr: rides.WAIT_TIME_MINUTES
          data_type: NUMBER
        - name: PICKUP_LATITUDE
          description: Latitude of pickup location
          expr: rides.PICKUP_LAT
          data_type: NUMBER
        - name: PICKUP_LONGITUDE
          description: Longitude of pickup location
          expr: rides.PICKUP_LON
          data_type: NUMBER
        - name: DROPOFF_LATITUDE
          description: Latitude of dropoff location
          expr: rides.DROPOFF_LAT
          data_type: NUMBER
        - name: DROPOFF_LONGITUDE
          description: Longitude of dropoff location
          expr: rides.DROPOFF_LON
          data_type: NUMBER

    - name: MARKETING_CAMPAIGNS
      description: Marketing campaigns for driver recruitment and client acquisition
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: MARKETING_CAMPAIGNS
      primary_key:
        columns:
          - CAMPAIGN_ID
      dimensions:
        - name: CAMPAIGN_ID
          description: Unique identifier for the marketing campaign
          expr: marketing_campaigns.CAMPAIGN_ID
          data_type: VARCHAR
        - name: CAMPAIGN_NAME
          description: Name of the marketing campaign
          expr: marketing_campaigns.CAMPAIGN_NAME
          data_type: VARCHAR
        - name: CAMPAIGN_TYPE
          description: Type of campaign (CareDriver Recruitment, Client Acquisition, Brand Awareness)
          expr: marketing_campaigns.CAMPAIGN_TYPE
          data_type: VARCHAR
        - name: CAMPAIGN_CHANNEL
          description: Marketing channel used (Social Media, Email, Search, Display)
          expr: marketing_campaigns.CHANNEL
          data_type: VARCHAR
        - name: CAMPAIGN_START_DATE
          description: Campaign start date
          expr: marketing_campaigns.START_DATE
          data_type: DATE
        - name: CAMPAIGN_END_DATE
          description: Campaign end date
          expr: marketing_campaigns.END_DATE
          data_type: DATE
        - name: TARGET_AUDIENCE
          description: Target audience for the campaign (Drivers, Schools, Families)
          expr: marketing_campaigns.TARGET_AUDIENCE
          data_type: VARCHAR
      facts:
        - name: CAMPAIGN_AD_SPEND
          description: Total advertising spend for the campaign
          expr: marketing_campaigns.AD_SPEND
          data_type: NUMBER

    - name: CAMPAIGN_RESULTS
      description: Performance metrics and results from marketing campaigns
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: CAMPAIGN_RESULTS
      primary_key:
        columns:
          - RESULT_ID
      dimensions:
        - name: RESULT_ID
          description: Unique identifier for the campaign result
          expr: campaign_results.RESULT_ID
          data_type: VARCHAR
        - name: METRIC_TYPE
          description: Type of metric (Driver Signups, Client Signups, Leads, Revenue)
          expr: campaign_results.METRIC_TYPE
          data_type: VARCHAR
        - name: RESULT_DATE
          description: Date of the campaign result
          expr: campaign_results.RESULT_DATE
          data_type: DATE
        - name: GEOGRAPHIC_MARKET
          description: Geographic market for the result
          expr: campaign_results.GEOGRAPHIC_MARKET
          data_type: VARCHAR
      facts:
        - name: METRIC_VALUE
          description: Numeric value of the metric
          expr: campaign_results.METRIC_VALUE
          data_type: NUMBER

    - name: RIDER_FEEDBACK
      description: Customer feedback and ratings for rides
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: RIDER_FEEDBACK
      primary_key:
        columns:
          - FEEDBACK_ID
      dimensions:
        - name: FEEDBACK_ID
          description: Unique identifier for the feedback entry
          expr: rider_feedback.FEEDBACK_ID
          data_type: VARCHAR
        - name: FEEDBACK_DATE
          description: Date when feedback was provided
          expr: rider_feedback.FEEDBACK_DATE
          data_type: DATE
        - name: FEEDBACK_COMMENTS
          description: Text comments from the rider or family
          expr: rider_feedback.COMMENTS
          data_type: VARCHAR
        - name: SENTIMENT
          description: Overall sentiment of feedback (Positive, Neutral, Negative)
          expr: rider_feedback.SENTIMENT
          data_type: VARCHAR
      facts:
        - name: RATING
          description: Numeric rating from 1.0 to 5.0
          expr: rider_feedback.RATING
          data_type: NUMBER

    - name: MARKET_LEADS
      description: Potential client leads and conversion tracking
      base_table:
        database: RIDESHARE_DEMO
        schema: RIDESHARE_DATA
        table: MARKET_LEADS
      primary_key:
        columns:
          - LEAD_ID
      dimensions:
        - name: LEAD_ID
          description: Unique identifier for the lead
          expr: market_leads.LEAD_ID
          data_type: VARCHAR
        - name: LEAD_NAME
          description: Name of the potential client
          expr: market_leads.LEAD_NAME
          data_type: VARCHAR
        - name: LEAD_TYPE
          description: Type of lead (School District, Agency, Family)
          expr: market_leads.LEAD_TYPE
          data_type: VARCHAR
        - name: LEAD_STATE
          description: State where the lead is located
          expr: market_leads.STATE
          data_type: VARCHAR
        - name: LEAD_CITY
          description: City where the lead is located
          expr: market_leads.CITY
          data_type: VARCHAR
        - name: LEAD_DATE
          description: Date when the lead was generated
          expr: market_leads.LEAD_DATE
          data_type: DATE
        - name: CONVERTED_TO_CLIENT
          description: Whether the lead converted to a client (true/false)
          expr: market_leads.CONVERTED_TO_CLIENT
          data_type: BOOLEAN
        - name: CONVERSION_DATE
          description: Date when the lead converted to a client
          expr: market_leads.CONVERSION_DATE
          data_type: DATE
        - name: LEAD_MARKETING_SOURCE
          description: Marketing source that generated the lead
          expr: market_leads.MARKETING_SOURCE
          data_type: VARCHAR

  relationships:
    - name: RIDES_CLIENTS
      left_table: RIDES
      right_table: CLIENTS
      relationship_columns:
        - left_column: CLIENT_ID
          right_column: CLIENT_ID
      relationship_type: many_to_one

    - name: RIDES_CARE_DRIVERS
      left_table: RIDES
      right_table: CARE_DRIVERS
      relationship_columns:
        - left_column: DRIVER_ID
          right_column: DRIVER_ID
      relationship_type: many_to_one

    - name: RIDER_FEEDBACK_RIDES
      left_table: RIDER_FEEDBACK
      right_table: RIDES
      relationship_columns:
        - left_column: RIDE_ID
          right_column: RIDE_ID
      relationship_type: many_to_one

    - name: RIDER_FEEDBACK_CLIENTS
      left_table: RIDER_FEEDBACK
      right_table: CLIENTS
      relationship_columns:
        - left_column: CLIENT_ID
          right_column: CLIENT_ID
      relationship_type: many_to_one

    - name: RIDER_FEEDBACK_CARE_DRIVERS
      left_table: RIDER_FEEDBACK
      right_table: CARE_DRIVERS
      relationship_columns:
        - left_column: DRIVER_ID
          right_column: DRIVER_ID
      relationship_type: many_to_one

    - name: CAMPAIGN_RESULTS_MARKETING_CAMPAIGNS
      left_table: CAMPAIGN_RESULTS
      right_table: MARKETING_CAMPAIGNS
      relationship_columns:
        - left_column: CAMPAIGN_ID
          right_column: CAMPAIGN_ID
      relationship_type: many_to_one

  metrics:
    - name: TOTAL_RIDES
      description: Total number of rides
      expr: COUNT(rides.RIDE_ID)
      
    - name: COMPLETED_RIDES
      description: Number of completed rides
      expr: COUNT(CASE WHEN rides.RIDE_STATUS = 'Completed' THEN 1 END)
      
    - name: CANCELLED_RIDES
      description: Number of cancelled rides
      expr: COUNT(CASE WHEN rides.RIDE_STATUS = 'Cancelled' THEN 1 END)
      
    - name: NO_SHOW_RIDES
      description: Number of no-show rides
      expr: COUNT(CASE WHEN rides.RIDE_STATUS = 'No-Show' THEN 1 END)
      
    - name: TOTAL_RIDE_REVENUE
      description: Total revenue from all completed rides
      expr: SUM(CASE WHEN rides.RIDE_STATUS = 'Completed' THEN rides.RIDE_COST ELSE 0 END)
      
    - name: AVERAGE_RIDE_COST
      description: Average cost per completed ride
      expr: AVG(CASE WHEN rides.RIDE_STATUS = 'Completed' THEN rides.RIDE_COST END)
      
    - name: AVERAGE_WAIT_TIME
      description: Average wait time for ride confirmation in minutes
      expr: AVG(rides.WAIT_TIME_MINUTES)
      
    - name: RIDE_COMPLETION_RATE
      description: Percentage of rides that are completed
      expr: ROUND((COUNT(CASE WHEN rides.RIDE_STATUS = 'Completed' THEN 1 END) * 100.0 / NULLIF(COUNT(rides.RIDE_ID), 0)), 2)
      
    - name: TOTAL_CLIENTS
      description: Total number of clients
      expr: COUNT(DISTINCT clients.CLIENT_ID)
      
    - name: ACTIVE_CLIENTS
      description: Number of active clients
      expr: COUNT(DISTINCT CASE WHEN clients.STATUS = 'Active' THEN clients.CLIENT_ID END)
      
    - name: TOTAL_CARE_DRIVERS
      description: Total number of CareDrivers
      expr: COUNT(DISTINCT care_drivers.DRIVER_ID)
      
    - name: ACTIVE_CARE_DRIVERS
      description: Number of active CareDrivers
      expr: COUNT(DISTINCT CASE WHEN care_drivers.STATUS = 'Active' THEN care_drivers.DRIVER_ID END)
      
    - name: AVERAGE_CERTIFICATION_TIME
      description: Average days to complete CareDriver certification
      expr: AVG(care_drivers.CERTIFICATION_DAYS)
      
    - name: AVERAGE_DRIVER_RATING
      description: Average driver rating across all feedback
      expr: AVG(rider_feedback.RATING)
      
    - name: TOTAL_MARKETING_SPEND
      description: Total marketing campaign spend
      expr: SUM(marketing_campaigns.AD_SPEND)
      
    - name: TOTAL_CAMPAIGN_REVENUE
      description: Total revenue attributed to marketing campaigns
      expr: SUM(CASE WHEN campaign_results.METRIC_TYPE = 'Revenue' THEN campaign_results.METRIC_VALUE ELSE 0 END)
      
    - name: ROAS
      description: Return on Ad Spend (Revenue / Ad Spend)
      expr: ROUND(SUM(CASE WHEN campaign_results.METRIC_TYPE = 'Revenue' THEN campaign_results.METRIC_VALUE ELSE 0 END) / NULLIF(SUM(marketing_campaigns.AD_SPEND), 0), 2)
      
    - name: TOTAL_DRIVER_SIGNUPS
      description: Total driver signups from marketing campaigns
      expr: SUM(CASE WHEN campaign_results.METRIC_TYPE = 'Driver Signups' THEN campaign_results.METRIC_VALUE ELSE 0 END)
      
    - name: TOTAL_LEADS
      description: Total number of leads generated
      expr: COUNT(market_leads.LEAD_ID)
      
    - name: CONVERTED_LEADS
      description: Number of leads that converted to clients
      expr: COUNT(CASE WHEN market_leads.CONVERTED_TO_CLIENT = TRUE THEN 1 END)
      
    - name: LEAD_CONVERSION_RATE
      description: Percentage of leads that convert to clients
      expr: ROUND((COUNT(CASE WHEN market_leads.CONVERTED_TO_CLIENT = TRUE THEN 1 END) * 100.0 / NULLIF(COUNT(market_leads.LEAD_ID), 0)), 2)
      
    - name: SPECIAL_NEEDS_RIDES
      description: Number of rides for special needs students
      expr: COUNT(CASE WHEN rides.STUDENT_TYPE = 'Special Needs' THEN 1 END)
      
    - name: MCKINNEY_VENTO_RIDES
      description: Number of rides for McKinney-Vento (homeless) students
      expr: COUNT(CASE WHEN rides.STUDENT_TYPE = 'McKinney-Vento' THEN 1 END)
      
    - name: FOSTER_CARE_RIDES
      description: Number of rides for foster care students
      expr: COUNT(CASE WHEN rides.STUDENT_TYPE = 'Foster Care' THEN 1 END)
      
    - name: GENERAL_RIDES
      description: Number of general student rides
      expr: COUNT(CASE WHEN rides.STUDENT_TYPE = 'General' THEN 1 END)
      
    - name: POSITIVE_FEEDBACK_RATE
      description: Percentage of feedback with positive sentiment
      expr: ROUND((COUNT(CASE WHEN rider_feedback.SENTIMENT = 'Positive' THEN 1 END) * 100.0 / NULLIF(COUNT(rider_feedback.FEEDBACK_ID), 0)), 2)
      
    - name: AVERAGE_MONTHLY_CLIENT_SPEND
      description: Average monthly spend per client
      expr: AVG(CASE WHEN rides.RIDE_STATUS = 'Completed' THEN rides.RIDE_COST END)
  $$
);

-- Verify the semantic model was created successfully
SHOW SEMANTIC MODELS;

-- Grant usage permissions (adjust as needed for your environment)
-- GRANT USAGE ON SEMANTIC MODEL RIDESHARE_ANALYTICS TO ROLE PUBLIC;
