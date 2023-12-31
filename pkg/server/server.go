package server

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"

	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/handlers"
	"github.com/emil-1003/InvestmentTrackerBackendGolang/pkg/middleware"
)

type Server struct {
	Name    string
	Version string
	Router  *mux.Router
	Port    string
}

func New(name, version, port, path string) (*Server, error) {
	r := mux.NewRouter()

	s := r.PathPrefix(fmt.Sprintf("/%s/%s", path, version)).Subrouter()

	s.Path("/currencies").Handler(middleware.AuthOnly(handlers.GetCurrencies())).Methods("GET")

	s.Path("/transactiontypes").Handler(middleware.AuthOnly(handlers.GetTransactionTypes())).Methods("GET")

	s.Path("/transactions").Handler(middleware.AuthOnly(handlers.GetTransactions())).Methods("GET")
	s.Path("/transactions/symbol/{symbol}").Handler(middleware.AuthOnly(handlers.GetTransactionsBySymbol())).Methods("GET")
	s.Path("/transactions/portfolio/{portfolioID}").Handler(middleware.AuthOnly(handlers.GetTransactionsByPortfolio())).Methods("GET")
	s.Path("/transactions/portfolio/{portfolioID}/symbol/{symbol}").Handler(middleware.AuthOnly(handlers.GetTransactionsByPortfolioSymbol())).Methods("GET")
	s.Path("/transactions").Handler(middleware.AuthOnly(handlers.CreateTransaction())).Methods("POST")

	s.Path("/portfolios").Handler(middleware.AuthOnly(handlers.GetPortfolios())).Methods("GET")
	s.Path("/portfolios").Handler(middleware.AuthOnly(handlers.CreatePortfolio())).Methods("POST")

	return &Server{name, version, s, port}, nil
}

func (s *Server) ListenAndServe() error {
	return http.ListenAndServe(s.Port, s.Router)
}
