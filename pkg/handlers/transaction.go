package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/authentication"
	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/models"
	"github.com/gorilla/mux"
)

func GetTransactions() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		transactions, err := models.GetTransactions(token.Uid)
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactions: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactions)
	}
}

func GetTransactionsBySymbol() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		params := mux.Vars(r)
		symbol := params["symbol"]

		transactions, err := models.GetTransactionsBySymbol(token.Uid, symbol)
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactions: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactions)
	}
}

func GetTransactionsByPortfolio() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		params := mux.Vars(r)
		portfolioIDStr := params["portfolioID"]

		portfolioID, err := strconv.Atoi(portfolioIDStr)
		if err != nil {
			http.Error(w, "portfolioID need to a number", http.StatusBadRequest)
			return
		}

		transactions, err := models.GetTransactionsByPortfolio(token.Uid, portfolioID)
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactions: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactions)
	}
}

func GetTransactionsByPortfolioSymbol() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")

		token, ok := authentication.GetToken(r)
		if !ok {
			http.Error(w, "unauthorized", http.StatusUnauthorized)
			return
		}

		params := mux.Vars(r)
		portfolioIDStr := params["portfolioID"]
		symbol := params["symbol"]

		portfolioID, err := strconv.Atoi(portfolioIDStr)
		if err != nil {
			http.Error(w, "portfolioID need to a number", http.StatusBadRequest)
			return
		}

		transactions, err := models.GetTransactionsByPortfolioSymbol(token.Uid, portfolioID, symbol)
		if err != nil {
			http.Error(w, fmt.Errorf("failed to get transactions: %w", err).Error(), http.StatusNotFound)
			return
		}

		json.NewEncoder(w).Encode(transactions)
	}
}
