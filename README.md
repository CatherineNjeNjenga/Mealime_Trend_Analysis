# Mealime Subscription Analysis

## Company Background

<img width="1350" height="249" alt="mealime-logo-transparent-smaller-text" src="https://github.com/user-attachments/assets/0f487e00-53e9-468a-bb5d-f13a956a6ac2" />


Founded in 2013, Mealime is a meal planning and home cooking application that provides meal plans, grocery lists, and recipes tailored to users' dietary preferences. 
Mealime helps users in meal planning for cooking through its online platform and mobile app. Users need to set their food preferences by selecting the diet type like pescatarian, paleo vegetarian, low carbs, or allergens and other preferences. The app then displays recipes along with step-by-step cooking instruction, ingredient list, and required cookware. Curates a list of grocery items based on the recipes selected. The online platform features a community dashboard for users to share cooking tips. The app is available for iOS and Android. The app is free to download, and extra features can be subscribed for $9.99USD/month (Student), $19.99USD/month (Family) or $69.99USD/month (Premium).

<details>
  <summary>Project Goals</summary>
<br /> 
Mealime has been collecting data on a variety of key elements, including subscriptions, customer information, customer churn status, pricing plans, and geographic data. However, the data is currently unrefined and underutilized, presenting both challenges and opportunities for unlocking valuable insights.
<br /> 
<br /> 
In cleaning and analyzing Mealime's data, meaningful insights can be extracted from the dataset to support the company’s various teams—including finance, sales, product, and marketing. By providing actionable data insights, our aim is to improve operational efficiencies and drive better decision-making, ultimately helping Mealime optimize its processes and deliver superior products globally. 
</details>

<details>
  <summary>Stakeholder Questions</summary>
<br /> 
1. What were the overall subscriptions trends from 2019 to 2022? <br /> 
2. What were the company's yearly and monthly growth rates? <br /> 
3. How has the new Premium pricing plan performed? Should we keep the pricing, reduce the price or abandon it? <br /> 
4. What was the company's churn rate and average subscription order value (ASOV)? <br /> 
<br /> 

**Notes:**
- Focus on sales revenue, AOV, and order counts
- Look at trends over yearly and monthly periods 
- For refunds and AOV specifically compare across Apple products
</details>

<details open>
  <summary>Table of Contents</summary>

- [Executive Summary](#executive-summary)
- [Insights Deep Dive](#insights-deep-dive)
    - [Historical & Seasonal Trends](#historical-trends)
    - [Product Trends](#product-trends)
    - [Geographical Trends](#geographical-trends)
    - [Loyalty Program](#loyalty-program)
    - [Refund Rates](#refund-rates)
      - [Spotlight: Apple Products](#spotlight-apple-products)
- [Recommendations](#recommendations)
- [Appendix](#appendix)
</details>

# Executive Summary

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/e6bfff9d-789c-4805-a3e2-182a9395eb49" height="100%" width="100%"> <!--https://github.com/user-attachments/assets/1cebe6f3-02bf-4b8b-9e86-22bc6dfed832-->
</p>

**Mealime '** total sales from **2019 to 2022** reached **$28M**, with **108K total orders**. The company's **average order value (AOV)** across all years stands at **$260 per order**.

- In **2020**, the company experienced a **significant spike in sales** across all metrics. **Sales revenue more than doubled** to **$10M**, driven by a **twofold increase in order volume** (**34K orders**). **MacBook Air** sales were the main product driver of this spike, growing **384%** from 2019-2020. **March 2020** marked the **highest month-over-month (MoM) growth** in the company's history, with a **50% increase in sales**. This surge can likely be attributed to the impact of increased demand due to COVID-19 and the resulting lockdowns

- However, since 2020, the company has struggled to sustain the high sales levels seen during the pandemic. As global activities returned to normal, Mealime  experienced **a decline in YoY growth**, with **sales revenue dropping by 10% in 2021** and a sharper decline of **46% in 2022**. **AOV and order count** have also followed a **similar trend**

- The loyalty program, introduced in 2019, has shown promising growth potential. While non-loyalty members initially outperformed loyalty members in sales, the trend reversed in recent years, with loyalty members now leading in sales, order volume, and AOV evening out. Retaining and optimizing the program could drive future growth

- The Apple iPhone presents a strong opportunity for revenue growth. Despite low sales, its high AOV of $741 indicates untapped potential. Targeted strategies to boost iPhone sales could leverage the existing demand for Apple products and significantly increase revenue

<!--
The following analysis will provide key insights to help guide the company’s strategy moving forward, focusing on areas like geographical trends, product mix, and loyalty program performance. These insights will enable Mealime  to take informed action and identify new opportunities for growth and efficiency as the company navigates post-pandemic challenges.
-->

# Insights Deep Dive

### Historical Trends

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/3429f875-b034-4e89-96df-4c221ed4b8ff">
</p>

#### Sales Revenue
- **Entire Period (2019-2022):** On average, monthly revenue grew by 1.4%, generating average monthly revenue of $585K.
- **COVID Era Growth:** From January 2019 to December 2020, Mealime  averaged 7% monthly revenue growth peaking in December with $1.2M generated in monthly revenue 
- **Post-COVID:** Since December 2020, sales have generally declined, with the largest drop occurring in October 2022 (-55%), where monthly sales fell to $178K

#### AOV
- **Entire Period (2019-2022):** AOV on average was $253 per month, with an average monthly growth rate of 0.3%
- **Peaks & Valleys in AOV**: AOV saw its highest level at $322 per order in October 2020 but dropped to a low of $217 by October 2022

#### Order Count
- **Order count** trends closely followed sales revenue
- **Entire Period (2019-2022):** The average monthly growth rate for orders was 1.1% with an average of 2K orders per month
- **Peaks & Valleys in Order Count**: The company saw its highest order volume in December 2020, with 4K orders, but by October 2022 it reached its lowest with 825 orders

<!--
#### Sales Revenue
- From **January 2019 to December 2020**, Mealime  experienced steady growth in sales revenue, **averaging** a **7% monthly increase**. This growth led to a **peak** monthly revenue of **$1.2M** in **December 2020**. For comparison, the average monthly growth rate for the **entire period** (2019-2022) was **1.4%**, with an average monthly revenue of **$585K**.
- Following this peak, the company experienced two consecutive months of decline: **-18%** in **January 2021** and **-31%** in **February 2021**. Since December 2020, sales have generally declined, with the largest drop occurring in **October 2022 (-55%)**, where sales fell to **$178K**
- Despite the overall downward trend, there were moments of recovery. From **June to September 2021**, sales grew by **10% monthly** on average, and a **36% spike** occurred from **November to December 2021**

#### AOV
- In contrast to sales revenue, **AOV** has remained relatively stable. From **2019 to 2022**, the average monthly AOV was **$253**, with a modest average monthly growth rate of **0.3%**
- AOV peaked at **$322 per order** in **October 2020** but dropped to a low of **$217** by **October 2022**. After this dip, AOV grew by **4% in November 2022** and **3% in December 2022**

#### Order Count
- **Order count** trends closely followed sales revenue. From **2019-2022**, the average monthly growth rate for orders was **1.1%**, with an average of **2K orders** per month
- The company saw its highest order volume in **December 2020**, with **4K orders**, and its lowest in **October 2022**, with **825 orders**
-->

### Seasonal Trends

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/2368b333-720c-44e5-961b-ea3f1fb1b32d" height="80%" width="80%">
</p> 

#### Key Trends
- **Best Performing Months:** January, September, and December consistently see the most revenue and number of orders
- **Worst Performing Months:** In contrast, sales and order counts tend to dip in February, June, and October, with February and October typically seeing a 25% decline from the previous month
- **Fall Season AOV Trend:** The data show a seasonal 7% increase in AOV during the fall months (August-October)
- **End-of-Year Sales Surge:** November and December consistently deliver a surge in revenue, with average monthly increases of 18% and 23% respectively

# Product Trends

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/48223ff5-db3a-432f-ad17-198600d68ac1">
</p>

- **Highest Grossing Products:** 27-inch 4K Gaming Monitor, Apple AirPods, and MacBook Air account for 85% of total sales, generating $9.8M, $7.7M, and $6.2M respectively
- **Most Expensive Products (AOV):** MacBook Air ($1,591), ThinkPad ($1,101), and Apple iPhone ($741) lead products in terms of AOV
- **Most Ordered Products:** Apple AirPods lead in order volume with 48K orders, followed by 27-inch 4K Gaming Monitor with 23K orders, and Samsung Charging Cable Pack with 21K orders
- **Weakest Product:** Across all metrics, the Bose Soundsport underperformed, with just $3K in total sales, 27 orders, and an AOV of $124

#### Apple iPhone's Untapped Sales Potential

- Despite low sales and order counts, the **Apple iPhone** consistently ranks **third-highest in AOV**, with an **all-time AOV of $741**, indicating possible **untapped potential**
- A deeper analysis across more granular time periods shows the iPhone maintains a high AOV, with a **monthly average of $737**. 
- Given the popularity of other **Apple** products sold by the company, focusing on strategies to increase iPhone sales could provide a valuable opportunity to **significantly boost company revenue**

# Geographical Trends

> ### Mealime  operates across four regions and 194 countries

<!--
## Regional 

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/f5c1dc17-879a-4b23-9a87-06725651a82c" height="75%" width="75%">
</p>
-->

<!--
- **Best Performing Region (Sales):** **North America** was the best-performing region, generating **$14M** in sales and accounting for more than **50%** of total company sales
- **Worst Performing Region (Sales):** In contrast, **Latin America** was the lowest-performing region, with just **$1.6M** in sales
- **Leading Region in AOV:** **APAC** leads in terms of the highest average order value (AOV), with an average AOV of **$280**. This is largely driven by **Japan**, which has an exceptionally high AOV of **$393**


## By Country
-->

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/f1c5540c-0f94-40b0-b8c7-bb869295899e" height="95%" width="95%">
</p>

- **Top Performing Country:** The United States is the company's top-performing country, driving 47% of total sales, and is the primary contributor to North America's dominance in both sales revenue and order count
- **Top 10 Countries:** The top 10 countries by sales revenue account for approximately 80% of total sales. These countries, ranked by sales revenue, are: **United States**, **United Kingdom**, **Canada**, **Japan**, **Germany**, **Australia**, **Brazil**, **France**, **Spain**, and **the Netherlands**
- **AOV Performance:** Among these top 10 countries, Japan ($393) and the Netherlands ($289) have the highest AOV, while Spain has the lowest AOV at $223

 
# Loyalty Program

> ### Should the company keep the loyalty program?
<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/35f31e7e-77d3-4dcc-a6e6-949a29c85b14" height="100%" width="100%"> <!--https://github.com/user-attachments/assets/b3d0103b-fe83-4678-93c0-26669082ae15-->
</p>

<!--https://github.com/user-attachments/assets/57d9faa4-8884-4bcc-b714-8c6da342662b-->

The company introduced a loyalty program in 2019 to incentivize customers to make more frequent purchases. Five years later, they are evaluating whether to continue the program.

### Key Insights:
- Overall, non-loyalty members have outpaced loyalty members in total sales, generating **$17M** compared to **$11M**, with generally higher AOV (except in 2022)
- However, a **trend reversal** occurred after the first two years. Since then, loyalty members have **surpassed non-loyalty members** in both sales and order count
- Additionally, loyalty members' AOV has been steadily rising and, by 2022, exceeded the AOV of non-loyalty members

### Recommendation:
Although the data does not provide a decisive conclusion about the loyalty program's impact, the upward trend in loyalty members' performance, particularly in the last two years, suggests potential for future growth. Based on this, it is recommended to retain the loyalty program and closely monitor its performance over the next few years. The recent positive trends warrant further observation before making a long-term decision.

<!--
### Recommendation:
Although the data does not provide a decisive conclusion about the loyalty program's impact, the upward trend in loyalty members' performance, particularly in the last two years, suggests potential for future growth. Based on this, it is recommended to retain the loyalty program and closely monitor its performance over the next few years. The recent positive trends warrant further observation before making a long-term decision.
-->

<!-- Commented out parts -->

# Refund Rates

**Overall Refund Rate:** The company-wide refund rate was **5%**, with **5,377 refunds** out of **108K orders**, totaling **$2.1M** in refunded sales

## Across All Products

- **Highest Refund Rates:** ThinkPad (11.7%), MacBook Air (11.4%), and Apple iPhone (7.6%) had the highest refund rates
- **Most Frequent Refunds:** Apple AirPods and the 27-inch 4K Gaming Monitor were refunded most often, with 2.6K and 1.4K refunds, respectively
- **Highest Total Refund Amounts:** The MacBook Air ($719K), 27-inch 4K Gaming Monitor ($607K), Apple AirPods ($421K), and ThinkPad ($376K) recorded the highest total refunded sales

<!--
### Least Refunded Products:
- **Lowest Refund Rates:** The Samsung Charging Cable Pack and Samsung Webcam had refund rates of 1.3% and 2.6%, respectively
- **Lowest Refund Counts:** The Apple iPhone had the lowest refund count, with only 22 refunds, followed by the Samsung Webcam with 186 refunds
- **Lowest Total Refund Amounts:** The Samsung Charging Cable Pack ($6K), Samsung Webcam ($9.3K), and Apple iPhone ($6K) had the lowest refunded sales amounts

**Note:** The Bose Soundsport was the only product never refunded


### Notable Insights: 
- Together, **Apple Airpods** (49%) and **27in 4K Gaming Monitor** (27%) make up **more than 75% of all refunds** in terms of refund counts
- More than **75%** of all refunds occurred **before 2021** with 18% in 2019 and 58% in 2020
- 2022 had no refunds
-->

## Spotlight: Apple Products 

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/def731a2-4004-476c-9604-12d6c5811fc6">
</p>

#### Refund Metrics: 
- Apple products have an overall refund rate of 5.9%, totaling slightly over 3K refunds
- The MacBook Air has the highest refund rate among Apple products at 11.4%, while Apple AirPods were refunded most frequently, with 2.6K refunds, making up 85% of all Apple refunds

#### Notable Insights:
- **Apple** products account for **58%** of all refunds, totaling **$841K**—the **highest** refund amount of any brand
- Approximately **60%** of Apple refunds **occurred in 2020**, with a notable decrease in 2021 and no refunds recorded in 2022

<!---->
# Recommendations

Based on the analysis and insights, the team recommends the following: 

### Seasonal Promotions
Given seasonal trends, we recommend Mealime  considers implementing strategic promotions to either capitalize on or counteract these patterns. Some suggestions include:

- **Fall Savings Event**: Use bundled discounts on high-AOV items like the iPhone and MacBook Air, with a “Buy More, Save More” approach to drive higher-value purchases
- **Summer Essentials Sale**: Combat the summer sales lull with discounts on essentials (chargers, headphones, etc.) and free shipping to boost order volume
- **End-of-Year Clearance**: Run a November-December clearance on prior-year models, offering loyalty members early access and extra discounts to increase engagement

### Product Lineup
- **Bose Soundsport**'s consistently poor performance across all years and metrics warrants consideration for removal or replacement
- Work with product and sales teams to evaluate its viability and explore potential alternatives to optimize the product portfolio

### Strategies to Boost iPhone Sales

To capitalize on the Apple iPhone’s high average order value (AOV) and untapped growth potential, the following strategies are recommended:

- **Target High-Spending Customer Segments**: Direct marketing efforts toward segments with high-value purchasing patterns to drive more iPhone sales. Key targets include **website customers** (who average **$257 higher AOV** than app users), **loyalty members** (with higher average spending than non-members in 2022), and regions like the **US** (highest sales volume), **Japan**, and the **Netherlands** (highest AOV countries)
- **Leverage Cross-Selling Opportunities**: Bundle the iPhone with other Apple products, such as the MacBook Air and Apple AirPods, to encourage complementary purchases and increase the overall transaction value

The company should track the effectiveness of these campaigns closely, evaluating shifts in iPhone order volume and AOV. Using this data to refine marketing approaches, optimizing based on customer response and sales performance trends.

### Loyalty Program
- The performance of the loyalty program has been steadily improving, and it is recommended to **retain** the program while closely monitoring its results over the next few years
- To **boost engagement**, the company should consider introducing additional **benefits** and **targeted discounts** for loyalty members such as exclusive promotions and early access to new products

### Refund Rates
- Collaborate with the product team to investigate the high refund rates of the ThinkPad and MacBook Air laptops with a focus on reducing the amount of refunds associated with Apple products

<!--
# Appendix: Tables & Graphs
> <details>
> <summary>Graph - Yearly Product Trends (Drivers of 2020 Spike)</summary>
> <p align="center" width="100%">
> <img src="https://github.com/user-attachments/assets/c2110688-a93c-4e26-ab6d-33fb03121521" height="85%" width="85%">
> </p>
> </details>

> <details>
> <summary>Pivot Table - Product Refund Metrics (All Products)</summary>
> <p align="center" width="100%">
> <img src="https://github.com/user-attachments/assets/97bf2075-c726-480a-8aa3-3c603e470fb8">
> </p>
> </details>

> <details>
> <summary>Pivot Table - Yearly Product Refund Trends</summary>
> <p align="center" width="100%">
> <img src="https://github.com/user-attachments/assets/8b0f6ea0-107c-4e92-9ff4-b57a0ff07e6d" height="85%" width="85%">
> </p>
> </details>

> <details>
> <summary>Pivot Table - Apple Product Refund Metrics</summary>
> <p align="center" width="100%">
> <img src="https://github.com/user-attachments/assets/5045d1ff-ff27-4210-9c9b-ac8653c27fc3">
> </p>
</details
-->
# Dashboard

To explore more trends use the interactive Tableau workbook [here](https://public.tableau.com/app/profile/mayer.scharlat/viz/MealimeElectronic-SalesDashboard/SalesDashboard)

<p align="center" width="100%">
<img src="https://github.com/user-attachments/assets/53e54652-233c-4dd3-8409-f50778f7f576">

</p>

## Appendix
-  For more details about the dataset and the data cleaning process check out the [ERD](https://github.com/user-attachments/assets/31778750-444f-4955-b73f-fc152ed77e35)  and the [Dataset Summary & Issue Log](https://drive.google.com/file/d/16kxh6qG9sHhr-ZR1ZikRC5AjvIbR3Uq5/view?usp=sharing)
-  Check out the full Excel [spreadsheet](https://github.com/m-scharlat/Mealime_Trend_Analysis/blob/main/Excel/Mealime_Analysis.xlsb)
-  See more of my [exploration](https://github.com/m-scharlat/Mealime_Trend_Analysis/blob/main/SQL/Mealime_exploration.sql) and [analysis](https://github.com/m-scharlat/Mealime_Trend_Analysis/blob/main/SQL/Mealime_analysis.sql) in SQL



