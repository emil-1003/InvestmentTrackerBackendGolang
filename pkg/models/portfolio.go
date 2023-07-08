package models

import (
	"fmt"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/database"
)

type Portfolio struct {
	ID     int    `json:"id"`
	Name   string `json:"name"`
	UserID int    `json:"-"`
}

func GetPortfolios(uid int) ([]Portfolio, error) {
	var portfolios []Portfolio

	rows, err := database.DB.Query(`
		SELECT *
		FROM portfolio
		WHERE userID = ?;
	`, uid)
	if err != nil {
		return portfolios, err
	}
	defer rows.Close()

	for rows.Next() {
		var p Portfolio

		if err := rows.Scan(&p.ID, &p.Name, &p.UserID); err != nil {
			return portfolios, err
		}

		portfolios = append(portfolios, p)
	}

	return portfolios, err
}

func CreatePortfolio(name string, userID int) error {
	_, err := database.DB.Exec(`
		INSERT INTO portfolio (name, userID)
		VALUES (?, ?)
	`, name, userID)
	if err != nil {
		return fmt.Errorf("failed to create portfolio: %w", err)
	}

	return err
}
