# Snowflake Intelligence Demo: Ridesharing Company

## Overview

This demo showcases the power of **Snowflake Intelligence** (Chat with your Data) for a ridesharing company that specializes in providing safe transportation for students to school. The demo includes a complete data model, synthetic data, semantic views, and pre-configured queries that demonstrate how Sales, Marketing, and Product teams can leverage AI-powered analytics to make data-driven decisions.

### Business Context

The ridesharing company provides rides for students to school, similar to Uber but specialized for children. Key aspects:

- **CareDrivers**: Specially certified drivers who complete a 15-point certification process
- **Client Types**: School Districts, Agencies, and Direct Families
- **Student Categories**: General, Special Needs, McKinney-Vento (homeless students), and Foster Care
- **Geographic Focus**: Major metro areas across the United States

## Demo Components

### 📁 File Structure

```
RIDESHARING_AI_DEMO/
├── README.md                          # This file
├── 01_create_database_schema.sql      # Database and table definitions
├── 02_load_synthetic_data.sql         # Synthetic data generation
├── 03_create_semantic_model.sql       # Semantic model using YAML configuration
├── agent_instructions.md              # AI agent configuration
└── semantic_view_description.md       # Detailed view documentation
```

### 🗄️ Database Schema

**Main Tables:**
- `CLIENTS` - School districts, agencies, and families
- `CARE_DRIVERS` - CareDrivers with certification details
- `RIDES` - Ride transactions with student types and timing
- `MARKETING_CAMPAIGNS` - Marketing campaign details
- `CAMPAIGN_RESULTS` - Campaign performance metrics
- `RIDER_FEEDBACK` - Customer feedback and ratings
- `MARKET_LEADS` - Lead tracking and conversion data

**Semantic Views:**
- `RIDESHARE_ANALYTICS_VIEW` - Comprehensive ride analytics
- `FEEDBACK_ANALYTICS_VIEW` - Feedback and sentiment analysis
- `MARKETING_ANALYTICS_VIEW` - Campaign performance and ROI
- `DRIVER_PERFORMANCE_VIEW` - Driver metrics and KPIs
- `CLIENT_PERFORMANCE_VIEW` - Client metrics and spend
- `LEAD_CONVERSION_VIEW` - Lead funnel analysis

## Setup Instructions

### Prerequisites

- Snowflake account with appropriate permissions
- Access to create databases, schemas, tables, and views
- Snowflake Intelligence (Cortex Analyst) enabled in your account

### Step 1: Create Database Schema

Run the first SQL script to create the database, schema, and tables:

```sql
-- Execute in Snowflake
@01_create_database_schema.sql
```

This creates:
- Database: `RIDESHARE_DEMO`
- Schema: `RIDESHARE_DATA`
- All base tables with relationships

### Step 2: Load Synthetic Data

Run the second SQL script to populate the database with realistic synthetic data:

```sql
-- Execute in Snowflake
@02_load_synthetic_data.sql
```

This generates:
- 20 clients across multiple states
- 30 CareDrivers with various certification statuses
- 5,450+ rides spanning 12 months
- 7 marketing campaigns with results
- 1,200+ feedback entries
- 10 leads with conversion tracking

### Step 3: Create Semantic Model

Run the third SQL script to create the semantic model using YAML configuration:

```sql
-- Execute in Snowflake
@03_create_semantic_model.sql
```

This creates a comprehensive semantic model with tables, relationships, and pre-defined metrics for Snowflake Intelligence.

### Step 4: Configure Snowflake Intelligence

1. **Upload Semantic Model**: Use the semantic views as the foundation
2. **Configure Agent Instructions**: Use `agent_instructions.md` for agent behavior
3. **Reference View Descriptions**: Use `semantic_view_description.md` for view documentation
4. **Test Queries**: Start with the sample queries below

## Sample Questions by Team

### 💼 For Sales Team

**Customer Insights & Targeting:**

1. *"What are the top 5 school districts by ride volume and average ride cost in the last 6 months?"*
   - Demonstrates: Client ranking, financial metrics, time-based filtering

2. *"Show me a list of school districts in Texas that had a 20% or more increase in ride requests for homeless students (McKinney-Vento) in the last quarter."*
   - Demonstrates: Growth analysis, geographic filtering, student type segmentation

3. *"Which clients have a high number of rides for students with special needs and what's their average monthly spend?"*
   - Demonstrates: Student type filtering, spend analysis

**Performance & Forecasting:**

4. *"What is our client retention rate for the top 20 clients in the last fiscal year?"*
   - Demonstrates: Retention calculation, fiscal year awareness

5. *"Generate a chart showing the trend of new client sign-ups and total ride requests over the last 12 months."*
   - Demonstrates: Trend analysis, visualization, time series

6. *"Based on historical data, what is the projected ride volume for the next quarter in the Los Angeles and Seattle markets?"*
   - Demonstrates: Forecasting, multi-market analysis

### 📊 For Marketing Team

**Campaign ROI:**

7. *"What was the return on ad spend (ROAS) for the 'CareDriver recruitment campaign' last quarter?"*
   - Demonstrates: ROI calculation, campaign-specific metrics

8. *"Compare the number of new CareDriver sign-ups from our recent social media campaign versus our email marketing efforts in the past 90 days."*
   - Demonstrates: Channel comparison, attribution analysis

9. *"Which geographic markets have the highest conversion rate from lead to a paying client?"*
   - Demonstrates: Conversion analysis, geographic segmentation

**Customer & Driver Behavior:**

10. *"What is the average time a new CareDriver takes to complete the 15-point certification process?"*
    - Demonstrates: Operational metrics, driver onboarding

11. *"Analyze rider feedback scores from the last month and highlight any negative trends or common issues mentioned in comments."*
    - Demonstrates: Sentiment analysis, text mining, trend identification

12. *"What is the average number of rides per CareDriver per week?"*
    - Demonstrates: Productivity metrics, driver utilization

### 🚀 For Product Team

**Operational Efficiency:**

13. *"Identify the top 10 most common reasons for a ride cancellation or no-show."*
    - Demonstrates: Operational analysis, root cause identification

14. *"What's the average wait time for a family to get a ride confirmation after a request is made, and how has this changed in the last 6 months?"*
    - Demonstrates: SLA tracking, trend analysis, customer experience metrics

15. *"Show me a heatmap of ride requests by time of day and location to help us determine peak demand."*
    - Demonstrates: Geographic analysis, temporal patterns, visualization

## Key Data Insights Built Into Demo

The synthetic data is designed to reveal specific insights:

### Sales Insights
- **Los Angeles** is the largest market (30% of rides)
- **Seattle** is second largest (20% of rides)
- **Texas markets** show strong growth in McKinney-Vento rides (20%+ increase in Q3 2024)
- Special needs rides represent significant revenue opportunity

### Marketing Insights
- **Social Media** is the most effective CareDriver acquisition channel
- **ROAS varies by campaign**: CareDriver recruitment campaigns show 3-4x returns
- **Geographic conversion rates**: California and Washington lead in lead-to-client conversion

### Product Insights
- **Top cancellation reasons**: Driver unavailable, weather conditions, vehicle issues
- **Wait times trending down**: Average confirmation time improved from ~25 min to ~18 min
- **Peak demand periods**: Morning rush (6-9 AM) and afternoon rush (2-5 PM)

## Using Snowflake Intelligence

### Connecting the Agent

1. Navigate to **Snowflake Intelligence** in your Snowflake account
2. Create a new agent or update existing agent
3. Configure the agent with:
   - **Database**: `RIDESHARE_DEMO`
   - **Schema**: `RIDESHARE_DATA`
   - **Semantic Views**: Select all 6 views
   - **Instructions**: Copy from `agent_instructions.md`

### Best Practices

1. **Start with broad questions** then drill down
2. **Specify time periods** for accurate results (e.g., "last 6 months", "Q3 2024")
3. **Use business terms** like "CareDriver", "McKinney-Vento", "fiscal year"
4. **Request visualizations** when appropriate (charts, heatmaps, trends)
5. **Follow up questions** to explore insights deeper

### Example Session Flow

```
You: "What are the top 5 school districts by ride volume in the last 6 months?"

Agent: [Returns ranked list with Los Angeles, Seattle, Dallas, Houston, Austin]

You: "For Los Angeles specifically, what's the breakdown by student type?"

Agent: [Shows distribution: 60% General, 18% Special Needs, 12% McKinney-Vento, 10% Foster Care]

You: "How does the wait time in Los Angeles compare to our other markets?"

Agent: [Compares average wait times across markets]
```

## Data Model Details

### Time Intelligence
- **Fiscal Year**: Starts in July (education sector alignment)
- **Date Range**: 12 months of historical data
- **Granularity**: Individual ride transactions
- **Pre-calculated periods**: Year, Quarter, Month, Week, Day, Hour

### Key Metrics
- **Financial**: Ride cost, total spend, ROAS, budget utilization
- **Operational**: Wait time, completion rate, rides per driver
- **Quality**: Ratings, feedback sentiment, cancellation reasons
- **Growth**: Sign-ups, retention, conversion rates

### Student Types
1. **General**: Standard student rides
2. **Special Needs**: Students requiring specialized care
3. **McKinney-Vento**: Homeless students (federally funded)
4. **Foster Care**: Foster care system students

## Customization Options

### Adjusting the Data
- Modify `02_load_synthetic_data.sql` to change data volumes or distributions
- Adjust date ranges to align with your demo timeline
- Add or remove clients/drivers to match your scenario

### Extending the Schema
- Add new tables for additional features (e.g., insurance, incidents)
- Create additional semantic views for specific use cases
- Expand student types or ride categories

### Modifying Agent Behavior
- Update `agent_instructions.md` to change agent personality or focus
- Add domain-specific terminology
- Include additional business rules or constraints

## Troubleshooting

### Common Issues

**No data returned:**
- Check date filters - data spans the last 12 months from current date
- Verify table names and schema references
- Confirm views are created successfully

**Slow queries:**
- Use pre-aggregated views (CLIENT_PERFORMANCE_VIEW, DRIVER_PERFORMANCE_VIEW) instead of base tables
- Add appropriate date filters
- Check for Cartesian joins in complex queries

**Agent doesn't understand question:**
- Be more specific with business terms
- Include time periods explicitly
- Break complex questions into simpler parts

## Demo Presentation Tips

### Opening
1. Introduce the business context (student transportation)
2. Explain the challenge (complex data, multiple teams, various questions)
3. Show the traditional approach (writing SQL, creating reports)
4. Introduce Snowflake Intelligence as the solution

### Core Demo
1. **Start with Sales questions** - show business value quickly
2. **Move to Marketing** - demonstrate ROI and attribution
3. **Finish with Product** - show operational insights

### Wow Moments
- Cross-functional queries (e.g., "Which marketing channel drives drivers with highest ratings?")
- Time-based comparisons (e.g., "How has X changed over time?")
- Predictive questions (e.g., "Project next quarter based on trends")
- Natural language flexibility (ask same question different ways)

### Closing
- Summarize the insights gained
- Highlight speed (minutes vs. days/weeks)
- Emphasize democratization (no SQL required)
- Show extensibility (easy to add more data sources)

## Additional Resources

### Documentation
- [Snowflake Intelligence Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-analyst)
- [Semantic Model Best Practices](https://docs.snowflake.com/en/user-guide/snowflake-cortex/semantic-model)
- [Cortex Functions](https://docs.snowflake.com/en/user-guide/snowflake-cortex/llm-functions)

### Support
- For issues with this demo, refer to `semantic_view_description.md` for detailed view documentation
- For Snowflake Intelligence questions, consult Snowflake support
- For customization help, review `agent_instructions.md`

## License & Usage

This demo is designed for Snowflake customer presentations and can be customized for specific use cases. Feel free to:
- Modify the data model for different industries
- Adjust synthetic data volumes and patterns
- Extend with additional features and tables
- Rebrand for specific customer scenarios

---

**Demo Version**: 1.0  
**Last Updated**: September 2025  
**Target Snowflake Version**: Enterprise Edition with Cortex Features

---

## Quick Start Checklist

- [ ] Execute `01_create_database_schema.sql`
- [ ] Execute `02_load_synthetic_data.sql`
- [ ] Execute `03_create_semantic_model.sql`
- [ ] Verify data loaded (check row counts)
- [ ] Verify semantic model created (SHOW SEMANTIC MODELS)
- [ ] Configure Snowflake Intelligence agent
- [ ] Load agent instructions from `agent_instructions.md`
- [ ] Test with sample questions
- [ ] Customize for your presentation
- [ ] Prepare demo narrative
- [ ] Practice Q&A scenarios

**Ready to demo!** 🚀
