package models

import (
	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/database"
)

type Transaction struct {
	ID                   int             `json:"id"`
	Symbol               string          `json:"symbol"`
	Name                 string          `json:"name"`
	Portfolio            Portfolio       `json:"portfolio"`
	Currency             Currency        `json:"currency"`
	SharesOwned          int             `json:"sharesowned"`
	CostPerShare         float64         `json:"costpershare"`
	Commission           float64         `json:"commission"`
	TransactionDate      string          `json:"transactiondate"`
	TransactionTime      string          `json:"transactiontime"`
	PurchaseExchangeRate float64         `json:"purchaseexchangerate"`
	TransactionType      TransactionType `json:"transactiontype"`
	Notes                string          `json:"notes"`
}

func GetTransactions(uid int) ([]Transaction, error) {
	var transactions []Transaction

	rows, err := database.DB.Query(`
		SELECT transaction.*, portfolio.name AS portfolioName, currency.name AS currencyName, transactionType.name AS transactionsTypeName
		FROM transaction
		JOIN portfolio ON transaction.portfolioID = portfolio.id
		JOIN currency ON transaction.currencyID = currency.id
		JOIN transactionType ON transaction.transactionsTypeID = transactionType.id
		WHERE portfolio.userID = ?;
	`, uid)
	if err != nil {
		return transactions, err
	}
	defer rows.Close()

	for rows.Next() {
		var t Transaction
		var p Portfolio
		var c Currency
		var tt TransactionType

		if err := rows.Scan(&t.ID, &t.Symbol, &t.Name, &p.ID, &c.ID, &t.SharesOwned, &t.CostPerShare, &t.Commission, &t.TransactionDate, &t.TransactionTime, &t.PurchaseExchangeRate, &tt.ID, &t.Notes, &p.Name, &c.Name, &tt.Name); err != nil {
			return transactions, err
		}

		t.Portfolio = p
		t.Currency = c
		t.TransactionType = tt

		transactions = append(transactions, t)
	}

	return transactions, err
}

func GetTransactionsBySymbol(uid int, symbol string) ([]Transaction, error) {
	var transactions []Transaction

	rows, err := database.DB.Query(`
		SELECT transaction.*, portfolio.name AS portfolioName, currency.name AS currencyName, transactionType.name AS transactionsTypeName
		FROM transaction
		JOIN portfolio ON transaction.portfolioID = portfolio.id
		JOIN currency ON transaction.currencyID = currency.id
		JOIN transactionType ON transaction.transactionsTypeID = transactionType.id
		WHERE portfolio.userID = ? AND transaction.symbol = ?;
	`, uid, symbol)
	if err != nil {
		return transactions, err
	}
	defer rows.Close()

	for rows.Next() {
		var t Transaction
		var p Portfolio
		var c Currency
		var tt TransactionType

		if err := rows.Scan(&t.ID, &t.Symbol, &t.Name, &p.ID, &c.ID, &t.SharesOwned, &t.CostPerShare, &t.Commission, &t.TransactionDate, &t.TransactionTime, &t.PurchaseExchangeRate, &tt.ID, &t.Notes, &p.Name, &c.Name, &tt.Name); err != nil {
			return transactions, err
		}

		t.Portfolio = p
		t.Currency = c
		t.TransactionType = tt

		transactions = append(transactions, t)
	}

	return transactions, err
}

func GetTransactionsByPortfolio(uid int, portfolioID int) ([]Transaction, error) {
	var transactions []Transaction

	rows, err := database.DB.Query(`
		SELECT transaction.*, portfolio.name AS portfolioName, currency.name AS currencyName, transactionType.name AS transactionsTypeName
		FROM transaction
		JOIN portfolio ON transaction.portfolioID = portfolio.id
		JOIN currency ON transaction.currencyID = currency.id
		JOIN transactionType ON transaction.transactionsTypeID = transactionType.id
		WHERE portfolio.userID = ? AND transaction.portfolioID = ?;
	`, uid, portfolioID)
	if err != nil {
		return transactions, err
	}
	defer rows.Close()

	for rows.Next() {
		var t Transaction
		var p Portfolio
		var c Currency
		var tt TransactionType

		if err := rows.Scan(&t.ID, &t.Symbol, &t.Name, &p.ID, &c.ID, &t.SharesOwned, &t.CostPerShare, &t.Commission, &t.TransactionDate, &t.TransactionTime, &t.PurchaseExchangeRate, &tt.ID, &t.Notes, &p.Name, &c.Name, &tt.Name); err != nil {
			return transactions, err
		}

		t.Portfolio = p
		t.Currency = c
		t.TransactionType = tt

		transactions = append(transactions, t)
	}

	return transactions, err
}
