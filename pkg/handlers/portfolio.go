package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/authentication"
	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/models"
)

func GetPortfolios() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		portfolios, err := models.GetPortfolios(token.Uid)
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get portfolios: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(portfolios)
	}
}

func CreatePortfolio() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		var body models.Portfolio
		if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
			http.Error(w, fmt.Errorf("failed to read body: %w", err).Error(), http.StatusBadRequest)
			return
		}

		if err := models.CreatePortfolio(body.Name, token.Uid); err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		w.Write([]byte("portfolio was registered successfully"))
	}
}
