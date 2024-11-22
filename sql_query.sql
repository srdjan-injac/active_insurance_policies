SELECT
	ds.AppId,
	d.DealDetailId,
	d.DecisionDate,
	di.PolicyNum,
	ca.VIN,
	applicant_info.FirstNm AS applicant_firstnm,
	applicant_info.MiddleNm AS applicant_middlenm,
	applicant_info.LastNm AS applicant_lastnm,
	applicant_info.Suffix AS applicant_suffix,
	p_a.AptNo,
	p_a.StreetNo,
	p_a.Street,
	p_a.StreetTyp,
	p_a.City,
	p.ApplicantState as State,
	p_a.PostalCd
FROM dbo.deals ds
LEFT JOIN dbo.deal d
	ON ds.AppID = d.AppId
	AND d.TypCd = 'C' 
	AND d.DecisionCd = 'F'
LEFT JOIN dbo.rdecisions rd
	ON d.DecisionCd = rd.DecisionCd
-- applicant
LEFT JOIN dbo.deal_customers applicant
	ON d.DealDetailId = applicant.DealDetailId
	AND applicant.PrimaryFlg = 1
LEFT JOIN dbo.customer applicant_info
	ON applicant.CustomerId = applicant_info.CustomerId
LEFT JOIN  [v01plsd03].[Consumer].[dbo].[addresses] p_a
	ON applicant.CustomerId = p_a.EntityId
	and p_a.EntityTyp = 'CU'
	and p_a.Verified = 1
LEFT JOIN dbo.Provenir p
	ON ds.AppId = p.ApplicationID
-- co-applicant
LEFT JOIN dbo.deal_customers co_applicant
	ON d.DealDetailId = co_applicant.DealDetailId
	AND co_applicant.PrimaryFlg = 0
LEFT JOIN dbo.customer co_applicant_info
	ON co_applicant.CustomerId = co_applicant_info.CustomerId
LEFT JOIN dbo.deal_collateral dc
	ON d.DealDetailId = dc.DealDetailId
	AND dc.ActiveFlg = 1
	AND dc.TradeFlg = 0
LEFT JOIN dbo.collateral_auto ca
	ON dc.CollateralId = ca.CollateralId
LEFT JOIN dbo.deal_insurances di
	ON d.DealDetailId = di.DealDetailId
	AND di.Verified = 1
WHERE d.DecisionDate between '2024-01-01' and '2024-01-31'
;
