package models

import (
	"fmt"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/database"
)

type Portfolio struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
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
