# Quick Start Guide - Ridesharing Company Demo

## 🚀 5-Minute Setup

### Step 1: Execute SQL Scripts (3 minutes)

Open Snowflake and run these scripts in order:

```sql
-- 1. Create schema (30 seconds)
@01_create_database_schema.sql

-- 2. Load data (1 minute)
@02_load_synthetic_data.sql

-- 3. Create semantic model (30 seconds)
@03_create_semantic_model.sql
```

### Step 2: Verify Data Loaded (30 seconds)

```sql
USE DATABASE RIDESHARE_DEMO;
USE SCHEMA RIDESHARE_DATA;

-- Should show ~5,450 rides
SELECT COUNT(*) FROM RIDES;

-- Should show 1 semantic model
SHOW SEMANTIC MODELS;
```

### Step 3: Configure Snowflake Intelligence (1 minute)

1. Go to **Snowflake Intelligence** in your Snowflake UI
2. Create a new agent:
   - **Name**: Ridesharing Analytics Agent
   - **Database**: `RIDESHARE_DEMO`
   - **Schema**: `RIDESHARE_DATA`
   - **Semantic Model**: `RIDESHARE_ANALYTICS`
3. Copy instructions from `agent_instructions.md` → paste into agent configuration
4. Save and activate

### Step 4: Test with Sample Question (30 seconds)

Ask the agent:
```
What are the top 5 school districts by ride volume and average ride cost in the last 6 months?
```

**Expected Result**: Los Angeles, Seattle, Dallas, Houston, Austin

---

## 📋 Demo Cheat Sheet

### Best Questions to Start With

**For Sales Demo:**
- "What are the top 5 school districts by ride volume in the last 6 months?"
- "Show Texas school districts with 20%+ increase in McKinney-Vento rides last quarter"
- "What is our client retention rate for the top 20 clients?"

**For Marketing Demo:**
- "What was the ROAS for the 'CareDriver recruitment campaign' last quarter?"
- "Compare CareDriver signups from social media vs email in the past 90 days"
- "Which markets have the highest lead-to-client conversion rate?"

**For Product Demo:**
- "What are the top 10 reasons for ride cancellations?"
- "What's the average wait time for ride confirmation and how has it changed?"
- "Show a heatmap of ride requests by time of day and location"

### Key Data Facts

- **Total Rides**: 5,450+ over 12 months
- **Clients**: 20 (school districts and agencies)
- **CareDrivers**: 30 (25 active, 5 in training)
- **Markets**: CA, WA, TX, AZ, CO, OR, NV, NM, UT, ID
- **Top Market**: Los Angeles (30% of rides)
- **Student Types**: General (60%), Special Needs (18%), McKinney-Vento (12%), Foster Care (10%)

### Database Structure

```
RIDESHARE_DEMO
└── RIDESHARE_DATA
    ├── Tables
    │   ├── CLIENTS (20 rows)
    │   ├── CARE_DRIVERS (30 rows)
    │   ├── RIDES (5,450+ rows)
    │   ├── MARKETING_CAMPAIGNS (7 rows)
    │   ├── CAMPAIGN_RESULTS (20 rows)
    │   ├── RIDER_FEEDBACK (1,200+ rows)
    │   └── MARKET_LEADS (10 rows)
    └── Views
        ├── RIDESHARE_ANALYTICS_VIEW
        ├── FEEDBACK_ANALYTICS_VIEW
        ├── MARKETING_ANALYTICS_VIEW
        ├── DRIVER_PERFORMANCE_VIEW
        ├── CLIENT_PERFORMANCE_VIEW
        └── LEAD_CONVERSION_VIEW
```

---

## 🎯 15-Minute Demo Script

### Opening (2 min)
"This company provides specialized student transportation - like Uber for kids going to school. They serve school districts, agencies, and families across the US, with special focus on students with special needs, homeless students, and foster care."

### Sales Questions (4 min)

**Q1**: "What are the top 5 school districts by ride volume and average ride cost in the last 6 months?"

*Show results, point out LA dominance*

**Q2**: "For Los Angeles specifically, show me the breakdown by student type"

*Highlight 18% special needs - revenue opportunity*

**Q3**: "Which clients have more than 100 rides for special needs students?"

*Show targeting opportunity*

### Marketing Questions (4 min)

**Q4**: "What was the ROAS for the 'CareDriver recruitment campaign' last quarter?"

*Show 4x return on ad spend*

**Q5**: "Compare driver signups from social media vs email in the past 90 days"

*Social media 2x better*

**Q6**: "Which markets have the best lead conversion rates?"

*California and Washington leading*

### Product Questions (4 min)

**Q7**: "What are the top 10 reasons for ride cancellations?"

*Driver unavailable is #1 - staffing issue*

**Q8**: "Show me average wait time trends over the last 6 months"

*Improving from 25 to 18 minutes*

**Q9**: "Create a heatmap of demand by hour and location"

*Morning and afternoon rush clear*

### Closing (1 min)
"In 15 minutes, we answered 9 complex business questions across 3 teams - no SQL required, no waiting for reports. That's the power of Snowflake Intelligence."

---

## 🔧 Troubleshooting

### Issue: No data in results

**Solution**: Check date filters - data is from the last 12 months from TODAY

```sql
-- Verify date range
SELECT MIN(RIDE_DATE), MAX(RIDE_DATE) FROM RIDES;
```

### Issue: Views not found

**Solution**: Ensure you're in the right schema

```sql
USE DATABASE RIDESHARE_DEMO;
USE SCHEMA RIDESHARE_DATA;
SHOW VIEWS;
```

### Issue: Agent gives wrong answers

**Solution**: 
1. Verify agent has access to all 6 views
2. Check agent instructions are loaded from `agent_instructions.md`
3. Be more specific with time periods in questions

### Issue: Slow query performance

**Solution**: Use pre-aggregated views
- Use `CLIENT_PERFORMANCE_VIEW` instead of joining CLIENTS + RIDES
- Use `DRIVER_PERFORMANCE_VIEW` instead of aggregating from RIDES
- Add date filters to limit data scanned

---

## 📊 Key Insights Built Into Data

### Sales Insights ✅
- Los Angeles is largest market (30% of rides)
- Texas markets show 20%+ growth in McKinney-Vento rides (Q3 2024)
- Special needs rides = higher cost = revenue opportunity
- Top 20 clients have 90%+ retention rate

### Marketing Insights ✅
- Social Media best channel for driver acquisition
- CareDriver recruitment campaigns: 3-4x ROAS
- California leads in lead-to-client conversion (40%+)
- Average certification time: 18 days

### Product Insights ✅
- Top cancellation: Driver unavailable (needs more drivers)
- Wait time improving: 25 min → 18 min (last 6 months)
- Peak demand: 6-9 AM and 2-5 PM (school hours)
- Completion rate: 85% (industry benchmark: 80%)

---

## 📁 File Guide

| File | Purpose | Use When |
|------|---------|----------|
| `README.md` | Complete documentation | Setting up or customizing demo |
| `QUICK_START.md` | This file - fast setup | You need to setup in 5 minutes |
| `sample_questions.md` | 45+ sample questions | Planning demo or practicing |
| `agent_instructions.md` | Agent configuration | Configuring Snowflake Intelligence |
| `semantic_view_description.md` | View documentation | Understanding data model |
| `01_create_database_schema.sql` | Schema setup | First-time setup |
| `02_load_synthetic_data.sql` | Data loading | First-time setup or refresh |
| `03_create_semantic_model.sql` | Semantic model creation | First-time setup |

---

## ✅ Pre-Demo Checklist

- [ ] All 3 SQL scripts executed successfully
- [ ] Data verification query returns 5,450+ rides
- [ ] Semantic model verified (SHOW SEMANTIC MODELS returns RIDESHARE_ANALYTICS)
- [ ] Snowflake Intelligence agent configured with semantic model
- [ ] Agent instructions loaded from `agent_instructions.md`
- [ ] Tested at least 3 sample questions
- [ ] Reviewed key insights above
- [ ] Selected 5-7 questions for your specific audience
- [ ] Prepared demo narrative/story
- [ ] Backup SQL queries ready (if needed)

---

## 🎬 Post-Demo

### What to Share with Audience
- `README.md` - Complete setup guide
- `sample_questions.md` - Question library
- Demo recording/screenshots

### What to Keep Internal
- `agent_instructions.md` - Configuration details
- `semantic_view_description.md` - Technical specs
- SQL scripts - Can share if requested

### Follow-Up Actions
1. Customize data for their industry
2. Add their specific metrics
3. Integrate with their actual data sources
4. Expand to additional use cases

---

**Last Updated**: September 2025  
**Setup Time**: 5 minutes  
**Demo Time**: 5-30 minutes (flexible)

**Ready to impress!** 🎉
