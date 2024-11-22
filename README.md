# Evaluating Insurance Policy Continuity with Verisk

## Objective
This project aimed to assess the utility of Verisk's insurance data in verifying applicants insurance policies for funded deals. The analysis involved examining transaction histories, policy renewals, and cancellation patterns to determine policy continuity. By categorizing policies into "old" and "new" based on VIN matches, the project provided actionable insights into applicant insurance behavior and the potential for further leveraging Verisk's services.

Additionally, the project analyzed whether the existence of a prior active insurance policy serves as a sufficient risk mitigation factor for loan approval and whether an applicant's historical insurance behavior can predict future policy continuity.

---

## Background
Verifying applicant insurance policies is critical for determining the risk and reliability of funded deals. This project analyzed funded applications by:
- **Examining active and inactive policies** prior to the decision date.
- **Categorizing policies** based on their VIN match (new or old policies).
- **Analyzing transaction histories** for continuity and cancellation patterns.
- **Evaluating prior active insurance policies** as predictors of future insurance behavior.

The analysis informed whether additional use cases of Verisk's data would be worthwhile for improving applicant insurance verification processes and risk mitigation.

---

## Approach

### Data Collection
- **User and Policy Data**: Extracted data from the SQL database containing application IDs, VINs, decision dates, and policy details.
- **Verisk API Integration**: Queried Verisk API using applicant name and address, receiving policy transaction histories and status details.
- **Historical Records**: Retrieved transaction descriptions, policy renewal dates, and VIN matches for each application.

### Analysis
1. **Policy Categorization**:
   - **Old Policies**: Insurance policies where the policy VIN does not match the VIN in the query.
   - **New Policies**: Policies where the policy VIN matches the VIN in the query.
2. **Policy Continuity**:
   - Analyzed cancellation patterns in transaction descriptions.
   - Checked for continuous renewal periods without cancellation:
     - ≥1 year for old policies.
     - ≥6 months for new policies.
3. **Predictive Analysis**:
   - Evaluated whether applicants with prior active insurance for at least 6 months were more likely to maintain an active policy for the next 6 months.

### Implementation
- **Identifying Active Policies**: Checked if policies were active for the 12 months preceding the decision date, considering policies without cancellations as active.
- **Categorizing Policies**: Classified policies as old or new based on VIN matches and sub-classified into cancelled or continuous based on transaction history.
- **Predictive Analysis**: Compared applicants with prior active insurance to those without to identify the likelihood of maintaining future active policies.

---

## Results

### Policy Categorization
- **Active Policies**: Out of 1613 applications, 1307 policies (81.05%) were active, while 306 policies (18.95%) were inactive.
- **Average Policy Length**: Active policies had an average length of **7 months (230.88 days)**, with the longest active policy spanning **736 days** .

### Predictive Insights
- Applicants with a prior active insurance policy for at least 6 months were **90.06% more likely** to maintain an active policy for the next 6 months compared to applicants without prior active policies.
- The existence of an old policy (regardless of VIN match) significantly correlated with higher likelihood of future policy continuity, indicating its value as a **risk mitigation factor**.

---

## Key Technologies
- **Languages**: Python, SQL
- **Libraries**: `pandas`, `datetime`, `requests`, `matplotlib`, `seaborn`

## [Explore the Complete Code in Jupyter Notebook](https://github.com/srdjan-injac/active_insurance_policies/blob/main/ODYS-42.ipynb)
---

## Insights
This project demonstrated the utility of Verisk’s data in analyzing applicant insurance policies. Key findings included:
- A **high percentage of active policies** for applications with Verisk responses.
- **Continuous policy renewals** and active status patterns as critical indicators of reliable applicants.
- Historical policy continuity served as a strong predictor of **future active policy maintenance**, making prior active policies a valuable risk mitigation factor.

These results inform potential enhancements to applicant verification workflows, improving the effectiveness of Verisk's data for decision-making.

---
[Back to My Portfolio](https://srdjan-injac.github.io/my_portfolio/)
