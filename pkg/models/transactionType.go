package models

import "github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/database"

type TransactionType struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

func GetTransactionTypes() ([]TransactionType, error) {
	var transactionTypes []TransactionType

	rows, err := database.DB.Query(`
		SELECT *
		FROM transactionType;
	`)
	if err != nil {
		return transactionTypes, err
	}
	defer rows.Close()

	for rows.Next() {
		var tt TransactionType

		if err := rows.Scan(&tt.ID, &tt.Name); err != nil {
			return transactionTypes, err
		}

		transactionTypes = append(transactionTypes, tt)
	}

	return transactionTypes, err
}
