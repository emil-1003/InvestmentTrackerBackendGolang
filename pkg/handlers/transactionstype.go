package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/models"
)

func GetTransactionTypes() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		transactionTypes, err := models.GetTransactionTypes()
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactiontypes: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactionTypes)
	}
}
