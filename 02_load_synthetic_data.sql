-- Snowflake Intelligence Demo: Ridesharing Company
-- Step 2: Load Synthetic Data

USE DATABASE RIDESHARE_DEMO;
USE SCHEMA RIDESHARE_DATA;

-- Insert Clients Data
INSERT INTO CLIENTS (CLIENT_ID, CLIENT_NAME, CLIENT_TYPE, STATE, CITY, SIGN_UP_DATE, STATUS, MONTHLY_BUDGET)
VALUES
    ('CLI001', 'Los Angeles Unified School District', 'School District', 'California', 'Los Angeles', '2023-01-15', 'Active', 125000),
    ('CLI002', 'Seattle Public Schools', 'School District', 'Washington', 'Seattle', '2023-02-20', 'Active', 85000),
    ('CLI003', 'Austin Independent School District', 'School District', 'Texas', 'Austin', '2023-03-10', 'Active', 65000),
    ('CLI004', 'Dallas County Schools', 'School District', 'Texas', 'Dallas', '2023-04-05', 'Active', 95000),
    ('CLI005', 'San Francisco Unified', 'School District', 'California', 'San Francisco', '2023-05-12', 'Active', 72000),
    ('CLI006', 'Houston Independent School District', 'School District', 'Texas', 'Houston', '2023-06-18', 'Active', 88000),
    ('CLI007', 'Phoenix Union High School District', 'School District', 'Arizona', 'Phoenix', '2023-07-22', 'Active', 55000),
    ('CLI008', 'Denver Public Schools', 'School District', 'Colorado', 'Denver', '2023-08-15', 'Active', 48000),
    ('CLI009', 'San Diego County Office of Education', 'Agency', 'California', 'San Diego', '2023-09-10', 'Active', 92000),
    ('CLI010', 'King County DCYF', 'Agency', 'Washington', 'Seattle', '2023-10-05', 'Active', 110000),
    ('CLI011', 'Portland Public Schools', 'School District', 'Oregon', 'Portland', '2024-01-12', 'Active', 52000),
    ('CLI012', 'Riverside Unified School District', 'School District', 'California', 'Riverside', '2024-02-20', 'Active', 38000),
    ('CLI013', 'Clark County School District', 'School District', 'Nevada', 'Las Vegas', '2024-03-15', 'Active', 78000),
    ('CLI014', 'Albuquerque Public Schools', 'School District', 'New Mexico', 'Albuquerque', '2024-04-08', 'Active', 42000),
    ('CLI015', 'Sacramento City Unified', 'School District', 'California', 'Sacramento', '2024-05-20', 'Active', 61000),
    ('CLI016', 'Tacoma Public Schools', 'School District', 'Washington', 'Tacoma', '2022-11-10', 'Churned', 35000),
    ('CLI017', 'Salt Lake City School District', 'School District', 'Utah', 'Salt Lake City', '2024-06-15', 'Active', 45000),
    ('CLI018', 'Boise Independent School District', 'School District', 'Idaho', 'Boise', '2024-07-01', 'Active', 33000),
    ('CLI019', 'Tucson Unified School District', 'School District', 'Arizona', 'Tucson', '2024-07-18', 'Active', 47000),
    ('CLI020', 'El Paso Independent School District', 'School District', 'Texas', 'El Paso', '2024-08-10', 'Active', 54000);

-- Insert CareDrivers Data
INSERT INTO CARE_DRIVERS (DRIVER_ID, DRIVER_NAME, STATE, CITY, SIGN_UP_DATE, CERTIFICATION_COMPLETE_DATE, CERTIFICATION_DAYS, STATUS, MARKETING_SOURCE)
VALUES
    ('DRV001', 'Sarah Johnson', 'California', 'Los Angeles', '2024-01-05', '2024-01-20', 15, 'Active', 'Social Media'),
    ('DRV002', 'Michael Chen', 'Washington', 'Seattle', '2024-01-10', '2024-01-28', 18, 'Active', 'Email'),
    ('DRV003', 'Emily Rodriguez', 'Texas', 'Austin', '2024-01-15', '2024-02-05', 21, 'Active', 'Social Media'),
    ('DRV004', 'David Williams', 'California', 'San Francisco', '2024-02-01', '2024-02-15', 14, 'Active', 'Referral'),
    ('DRV005', 'Jessica Martinez', 'Texas', 'Dallas', '2024-02-05', '2024-02-22', 17, 'Active', 'Social Media'),
    ('DRV006', 'Robert Taylor', 'Arizona', 'Phoenix', '2024-02-10', '2024-03-01', 20, 'Active', 'Email'),
    ('DRV007', 'Amanda Brown', 'Colorado', 'Denver', '2024-02-15', '2024-03-08', 22, 'Active', 'Direct'),
    ('DRV008', 'Christopher Davis', 'Washington', 'Seattle', '2024-03-01', '2024-03-16', 15, 'Active', 'Social Media'),
    ('DRV009', 'Jennifer Garcia', 'California', 'Los Angeles', '2024-03-05', '2024-03-25', 20, 'Active', 'Email'),
    ('DRV010', 'Matthew Wilson', 'Texas', 'Houston', '2024-03-10', '2024-03-27', 17, 'Active', 'Social Media'),
    ('DRV011', 'Ashley Anderson', 'California', 'San Diego', '2024-03-15', '2024-04-02', 18, 'Active', 'Referral'),
    ('DRV012', 'Daniel Thomas', 'Oregon', 'Portland', '2024-04-01', '2024-04-19', 18, 'Active', 'Social Media'),
    ('DRV013', 'Lauren Jackson', 'Nevada', 'Las Vegas', '2024-04-05', '2024-04-26', 21, 'Active', 'Email'),
    ('DRV014', 'James White', 'California', 'Sacramento', '2024-04-10', '2024-04-28', 18, 'Active', 'Social Media'),
    ('DRV015', 'Stephanie Harris', 'Washington', 'Tacoma', '2024-05-01', '2024-05-19', 18, 'Active', 'Direct'),
    ('DRV016', 'Kevin Martin', 'Utah', 'Salt Lake City', '2024-05-05', '2024-05-24', 19, 'Active', 'Social Media'),
    ('DRV017', 'Nicole Thompson', 'Arizona', 'Tucson', '2024-05-10', '2024-05-30', 20, 'Active', 'Email'),
    ('DRV018', 'Brian Lee', 'Texas', 'El Paso', '2024-06-01', '2024-06-18', 17, 'Active', 'Social Media'),
    ('DRV019', 'Rachel Walker', 'California', 'Riverside', '2024-06-05', '2024-06-25', 20, 'Active', 'Referral'),
    ('DRV020', 'Justin Hall', 'Idaho', 'Boise', '2024-06-10', '2024-06-30', 20, 'Active', 'Email'),
    ('DRV021', 'Melissa Allen', 'California', 'Los Angeles', '2024-07-01', '2024-07-22', 21, 'Active', 'Social Media'),
    ('DRV022', 'Andrew Young', 'Washington', 'Seattle', '2024-07-05', '2024-07-20', 15, 'Active', 'Social Media'),
    ('DRV023', 'Kimberly King', 'Texas', 'Dallas', '2024-07-10', '2024-07-31', 21, 'Active', 'Email'),
    ('DRV024', 'Steven Wright', 'California', 'San Francisco', '2024-07-15', '2024-08-01', 17, 'Active', 'Social Media'),
    ('DRV025', 'Michelle Scott', 'Texas', 'Austin', '2024-08-01', '2024-08-20', 19, 'Active', 'Referral'),
    ('DRV026', 'Ryan Green', 'California', 'Los Angeles', '2024-08-15', NULL, NULL, 'In Training', 'Social Media'),
    ('DRV027', 'Laura Adams', 'Washington', 'Seattle', '2024-08-20', NULL, NULL, 'In Training', 'Email'),
    ('DRV028', 'Brandon Baker', 'Texas', 'Houston', '2024-09-01', NULL, NULL, 'In Training', 'Social Media'),
    ('DRV029', 'Christina Nelson', 'Arizona', 'Phoenix', '2024-09-05', NULL, NULL, 'In Training', 'Email'),
    ('DRV030', 'Eric Carter', 'Colorado', 'Denver', '2024-09-10', NULL, NULL, 'In Training', 'Direct');

-- Insert Rides Data (Last 12 months)
INSERT INTO RIDES (RIDE_ID, CLIENT_ID, DRIVER_ID, RIDE_DATE, RIDE_TIME, STUDENT_TYPE, RIDE_COST, RIDE_STATUS, CANCELLATION_REASON, REQUEST_TIMESTAMP, CONFIRMATION_TIMESTAMP, WAIT_TIME_MINUTES, PICKUP_LAT, PICKUP_LON, DROPOFF_LAT, DROPOFF_LON)
SELECT
    'RIDE' || LPAD(seq4(), 6, '0'),
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 30 THEN 'CLI001'  -- LA gets 30% of rides
        WHEN UNIFORM(1, 100, RANDOM()) <= 50 THEN 'CLI002'  -- Seattle gets 20%
        WHEN UNIFORM(1, 100, RANDOM()) <= 65 THEN 'CLI004'  -- Dallas gets 15%
        WHEN UNIFORM(1, 100, RANDOM()) <= 75 THEN 'CLI006'  -- Houston gets 10%
        WHEN UNIFORM(1, 100, RANDOM()) <= 82 THEN 'CLI003'  -- Austin gets 7%
        WHEN UNIFORM(1, 100, RANDOM()) <= 88 THEN 'CLI005'  -- SF gets 6%
        WHEN UNIFORM(1, 100, RANDOM()) <= 92 THEN 'CLI009'  -- San Diego gets 4%
        WHEN UNIFORM(1, 100, RANDOM()) <= 95 THEN 'CLI010'  -- King County gets 3%
        ELSE ARRAY_CONSTRUCT('CLI007', 'CLI008', 'CLI011', 'CLI012', 'CLI013', 'CLI014', 'CLI015', 'CLI017', 'CLI018', 'CLI019', 'CLI020')[UNIFORM(0, 10, RANDOM())]
    END,
    ARRAY_CONSTRUCT('DRV001', 'DRV002', 'DRV003', 'DRV004', 'DRV005', 'DRV006', 'DRV007', 'DRV008', 'DRV009', 'DRV010',
                    'DRV011', 'DRV012', 'DRV013', 'DRV014', 'DRV015', 'DRV016', 'DRV017', 'DRV018', 'DRV019', 'DRV020',
                    'DRV021', 'DRV022', 'DRV023', 'DRV024', 'DRV025')[UNIFORM(0, 24, RANDOM())],
    DATEADD(day, -UNIFORM(0, 365, RANDOM()), CURRENT_DATE()),
    TIME_FROM_PARTS(UNIFORM(6, 18, RANDOM()), UNIFORM(0, 59, RANDOM()), 0),
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 60 THEN 'General'
        WHEN UNIFORM(1, 100, RANDOM()) <= 78 THEN 'Special Needs'
        WHEN UNIFORM(1, 100, RANDOM()) <= 88 THEN 'McKinney-Vento'
        ELSE 'Foster Care'
    END,
    UNIFORM(25, 150, RANDOM()) + (UNIFORM(0, 99, RANDOM()) / 100.0),
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 85 THEN 'Completed'
        WHEN UNIFORM(1, 100, RANDOM()) <= 93 THEN 'Cancelled'
        ELSE 'No-Show'
    END,
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) > 85 THEN 
            ARRAY_CONSTRUCT('Driver unavailable', 'Weather conditions', 'Vehicle issue', 'Student sick', 'Change of plans', 'Traffic delay', 'Parent cancelled', 'School closure', 'No reason provided', 'Emergency')[UNIFORM(0, 9, RANDOM())]
        ELSE NULL
    END,
    DATEADD(minute, -UNIFORM(15, 180, RANDOM()), DATEADD(day, -UNIFORM(0, 365, RANDOM()), CURRENT_TIMESTAMP())),
    DATEADD(minute, UNIFORM(2, 45, RANDOM()), DATEADD(minute, -UNIFORM(15, 180, RANDOM()), DATEADD(day, -UNIFORM(0, 365, RANDOM()), CURRENT_TIMESTAMP()))),
    UNIFORM(2, 45, RANDOM()) + (UNIFORM(0, 99, RANDOM()) / 100.0),
    34.0522 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    -118.2437 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    34.0522 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    -118.2437 + (UNIFORM(-200, 200, RANDOM()) / 1000.0)
FROM TABLE(GENERATOR(ROWCOUNT => 5000));

-- Add more McKinney-Vento rides in Texas for Q3 2024 (to show 20%+ increase)
INSERT INTO RIDES (RIDE_ID, CLIENT_ID, DRIVER_ID, RIDE_DATE, RIDE_TIME, STUDENT_TYPE, RIDE_COST, RIDE_STATUS, CANCELLATION_REASON, REQUEST_TIMESTAMP, CONFIRMATION_TIMESTAMP, WAIT_TIME_MINUTES, PICKUP_LAT, PICKUP_LON, DROPOFF_LAT, DROPOFF_LON)
SELECT
    'RIDE' || LPAD(seq4() + 5000, 6, '0'),
    ARRAY_CONSTRUCT('CLI003', 'CLI004', 'CLI006', 'CLI020')[UNIFORM(0, 3, RANDOM())],
    ARRAY_CONSTRUCT('DRV003', 'DRV005', 'DRV010', 'DRV018', 'DRV023', 'DRV025', 'DRV028')[UNIFORM(0, 6, RANDOM())],
    DATEADD(day, -UNIFORM(0, 90, RANDOM()), CURRENT_DATE()),
    TIME_FROM_PARTS(UNIFORM(6, 18, RANDOM()), UNIFORM(0, 59, RANDOM()), 0),
    'McKinney-Vento',
    UNIFORM(25, 150, RANDOM()) + (UNIFORM(0, 99, RANDOM()) / 100.0),
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 88 THEN 'Completed'
        WHEN UNIFORM(1, 100, RANDOM()) <= 95 THEN 'Cancelled'
        ELSE 'No-Show'
    END,
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) > 88 THEN 
            ARRAY_CONSTRUCT('Housing instability', 'Student relocated', 'Shelter transfer', 'Family emergency')[UNIFORM(0, 3, RANDOM())]
        ELSE NULL
    END,
    DATEADD(minute, -UNIFORM(15, 180, RANDOM()), DATEADD(day, -UNIFORM(0, 90, RANDOM()), CURRENT_TIMESTAMP())),
    DATEADD(minute, UNIFORM(2, 45, RANDOM()), DATEADD(minute, -UNIFORM(15, 180, RANDOM()), DATEADD(day, -UNIFORM(0, 90, RANDOM()), CURRENT_TIMESTAMP()))),
    UNIFORM(2, 45, RANDOM()) + (UNIFORM(0, 99, RANDOM()) / 100.0),
    32.7767 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    -96.7970 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    32.7767 + (UNIFORM(-200, 200, RANDOM()) / 1000.0),
    -96.7970 + (UNIFORM(-200, 200, RANDOM()) / 1000.0)
FROM TABLE(GENERATOR(ROWCOUNT => 450));

-- Insert Marketing Campaigns
INSERT INTO MARKETING_CAMPAIGNS (CAMPAIGN_ID, CAMPAIGN_NAME, CAMPAIGN_TYPE, CHANNEL, START_DATE, END_DATE, AD_SPEND, TARGET_AUDIENCE)
VALUES
    ('CAMP001', 'CareDriver recruitment campaign', 'CareDriver Recruitment', 'Social Media', '2024-04-01', '2024-06-30', 45000, 'Drivers'),
    ('CAMP002', 'Summer CareDriver Drive', 'CareDriver Recruitment', 'Email', '2024-06-01', '2024-08-31', 28000, 'Drivers'),
    ('CAMP003', 'Back to School Client Push', 'Client Acquisition', 'Search', '2024-07-01', '2024-09-15', 62000, 'Schools'),
    ('CAMP004', 'Q1 Brand Awareness', 'Brand Awareness', 'Display', '2024-01-01', '2024-03-31', 38000, 'Schools'),
    ('CAMP005', 'Safety First CareDriver Campaign', 'CareDriver Recruitment', 'Social Media', '2024-07-15', '2024-09-30', 52000, 'Drivers'),
    ('CAMP006', 'Family Direct Marketing', 'Client Acquisition', 'Email', '2024-05-01', '2024-07-31', 22000, 'Families'),
    ('CAMP007', 'Q2 Driver Retention', 'CareDriver Recruitment', 'Email', '2024-04-01', '2024-06-30', 18000, 'Drivers');

-- Insert Campaign Results
INSERT INTO CAMPAIGN_RESULTS (RESULT_ID, CAMPAIGN_ID, METRIC_TYPE, METRIC_VALUE, RESULT_DATE, GEOGRAPHIC_MARKET)
VALUES
    -- CareDriver recruitment campaign Q2 2024
    ('RES001', 'CAMP001', 'Driver Signups', 145, '2024-06-30', 'Los Angeles'),
    ('RES002', 'CAMP001', 'Driver Signups', 98, '2024-06-30', 'Seattle'),
    ('RES003', 'CAMP001', 'Driver Signups', 72, '2024-06-30', 'San Francisco'),
    ('RES004', 'CAMP001', 'Revenue', 182000, '2024-06-30', 'National'),
    
    -- Summer CareDriver Drive
    ('RES005', 'CAMP002', 'Driver Signups', 67, '2024-08-31', 'Texas'),
    ('RES006', 'CAMP002', 'Driver Signups', 54, '2024-08-31', 'Arizona'),
    ('RES007', 'CAMP002', 'Driver Signups', 89, '2024-08-31', 'California'),
    ('RES008', 'CAMP002', 'Revenue', 124000, '2024-08-31', 'National'),
    
    -- Back to School
    ('RES009', 'CAMP003', 'Client Signups', 23, '2024-09-15', 'National'),
    ('RES010', 'CAMP003', 'Leads', 187, '2024-09-15', 'National'),
    ('RES011', 'CAMP003', 'Revenue', 245000, '2024-09-15', 'National'),
    
    -- Q1 Brand Awareness
    ('RES012', 'CAMP004', 'Leads', 342, '2024-03-31', 'National'),
    ('RES013', 'CAMP004', 'Client Signups', 15, '2024-03-31', 'National'),
    
    -- Safety First
    ('RES014', 'CAMP005', 'Driver Signups', 156, '2024-09-30', 'Los Angeles'),
    ('RES015', 'CAMP005', 'Driver Signups', 112, '2024-09-30', 'Seattle'),
    ('RES016', 'CAMP005', 'Driver Signups', 87, '2024-09-30', 'Dallas'),
    ('RES017', 'CAMP005', 'Revenue', 218000, '2024-09-30', 'National'),
    
    -- Family Direct
    ('RES018', 'CAMP006', 'Leads', 234, '2024-07-31', 'California'),
    ('RES019', 'CAMP006', 'Client Signups', 8, '2024-07-31', 'California'),
    
    -- Q2 Driver Retention
    ('RES020', 'CAMP007', 'Driver Signups', 34, '2024-06-30', 'National');

-- Insert Rider Feedback
INSERT INTO RIDER_FEEDBACK (FEEDBACK_ID, RIDE_ID, CLIENT_ID, DRIVER_ID, FEEDBACK_DATE, RATING, COMMENTS, SENTIMENT)
SELECT
    'FB' || LPAD(seq4(), 6, '0'),
    'RIDE' || LPAD(UNIFORM(1, 5000, RANDOM()), 6, '0'),
    ARRAY_CONSTRUCT('CLI001', 'CLI002', 'CLI003', 'CLI004', 'CLI005', 'CLI006', 'CLI007', 'CLI008', 'CLI009', 'CLI010')[UNIFORM(0, 9, RANDOM())],
    ARRAY_CONSTRUCT('DRV001', 'DRV002', 'DRV003', 'DRV004', 'DRV005', 'DRV006', 'DRV007', 'DRV008', 'DRV009', 'DRV010')[UNIFORM(0, 9, RANDOM())],
    DATEADD(day, -UNIFORM(0, 90, RANDOM()), CURRENT_DATE()),
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 70 THEN 5.0
        WHEN UNIFORM(1, 100, RANDOM()) <= 85 THEN 4.0
        WHEN UNIFORM(1, 100, RANDOM()) <= 92 THEN 3.0
        WHEN UNIFORM(1, 100, RANDOM()) <= 97 THEN 2.0
        ELSE 1.0
    END,
    CASE UNIFORM(1, 10, RANDOM())
        WHEN 1 THEN 'Driver was excellent, very professional and great with my child'
        WHEN 2 THEN 'On time pickup and safe ride'
        WHEN 3 THEN 'Driver was late and seemed rushed'
        WHEN 4 THEN 'Perfect experience, will request this driver again'
        WHEN 5 THEN 'Communication could be better'
        WHEN 6 THEN 'Outstanding service, my child feels very safe'
        WHEN 7 THEN 'Driver was friendly but navigation was poor'
        WHEN 8 THEN 'Excellent! Driver went above and beyond'
        WHEN 9 THEN 'Vehicle was not as clean as expected'
        ELSE 'Great experience overall'
    END,
    CASE 
        WHEN UNIFORM(1, 100, RANDOM()) <= 75 THEN 'Positive'
        WHEN UNIFORM(1, 100, RANDOM()) <= 90 THEN 'Neutral'
        ELSE 'Negative'
    END
FROM TABLE(GENERATOR(ROWCOUNT => 1200));

-- Insert Market Leads
INSERT INTO MARKET_LEADS (LEAD_ID, LEAD_NAME, LEAD_TYPE, STATE, CITY, LEAD_DATE, CONVERTED_TO_CLIENT, CONVERSION_DATE, MARKETING_SOURCE)
VALUES
    ('LEAD001', 'Oakland Unified School District', 'School District', 'California', 'Oakland', '2024-06-15', TRUE, '2024-07-20', 'Search'),
    ('LEAD002', 'Long Beach Unified', 'School District', 'California', 'Long Beach', '2024-07-01', FALSE, NULL, 'Email'),
    ('LEAD003', 'Mesa Public Schools', 'School District', 'Arizona', 'Mesa', '2024-07-10', TRUE, '2024-08-15', 'Social Media'),
    ('LEAD004', 'Spokane Public Schools', 'School District', 'Washington', 'Spokane', '2024-07-20', FALSE, NULL, 'Search'),
    ('LEAD005', 'Fresno Unified School District', 'School District', 'California', 'Fresno', '2024-08-01', TRUE, '2024-09-01', 'Email'),
    ('LEAD006', 'Colorado Springs School District', 'School District', 'Colorado', 'Colorado Springs', '2024-08-05', FALSE, NULL, 'Social Media'),
    ('LEAD007', 'Reno County School District', 'School District', 'Nevada', 'Reno', '2024-08-10', FALSE, NULL, 'Direct'),
    ('LEAD008', 'Santa Clara Unified', 'School District', 'California', 'Santa Clara', '2024-08-15', TRUE, '2024-09-10', 'Search'),
    ('LEAD009', 'Glendale Unified School District', 'School District', 'Arizona', 'Glendale', '2024-08-20', FALSE, NULL, 'Email'),
    ('LEAD010', 'Bellevue School District', 'School District', 'Washington', 'Bellevue', '2024-09-01', TRUE, '2024-09-25', 'Social Media');

-- Verify data loaded successfully
SELECT 'Clients' AS TABLE_NAME, COUNT(*) AS ROW_COUNT FROM CLIENTS
UNION ALL
SELECT 'CareDrivers', COUNT(*) FROM CARE_DRIVERS
UNION ALL
SELECT 'Rides', COUNT(*) FROM RIDES
UNION ALL
SELECT 'Marketing Campaigns', COUNT(*) FROM MARKETING_CAMPAIGNS
UNION ALL
SELECT 'Campaign Results', COUNT(*) FROM CAMPAIGN_RESULTS
UNION ALL
SELECT 'Rider Feedback', COUNT(*) FROM RIDER_FEEDBACK
UNION ALL
SELECT 'Market Leads', COUNT(*) FROM MARKET_LEADS;
