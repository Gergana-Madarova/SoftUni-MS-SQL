USE [Geography]

-- All Mountain Peaks
SELECT [PeakName] FROM [Peaks] ORDER BY [PeakName]

-- Biggest Countries by Population
SELECT	TOP(30)  [CountryName], [Population]
		FROM	 [Countries]
		WHERE	 [ContinentCode]='EU'
		ORDER BY [Population] DESC, [CountryName]

-- Countries and Currency (Euro_NotEuro) CaseWhen
SELECT			[CountryName], [CountryCode],
		CASE
		WHEN	[CurrencyCode]= 'EUR' THEN 'Euro'
		ELSE	'Not Euro'
		END AS	'Currency'
FROM			[Countries]
ORDER BY		[CountryName]