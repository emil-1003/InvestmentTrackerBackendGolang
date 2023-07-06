package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/models"
)

func GetTransactions() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		transactions, err := models.GetTransactions()
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactions: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactions)
	}
}
