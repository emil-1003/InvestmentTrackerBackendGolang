package models

import "github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/database"

type Currency struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

func GetCurrencies() ([]Currency, error) {
	var currencies []Currency

	rows, err := database.DB.Query(`
		SELECT *
		FROM currency;
	`)
	if err != nil {
		return currencies, err
	}
	defer rows.Close()

	for rows.Next() {
		var c Currency

		if err := rows.Scan(&c.ID, &c.Name); err != nil {
			return currencies, err
		}

		currencies = append(currencies, c)
	}

	return currencies, err
}
