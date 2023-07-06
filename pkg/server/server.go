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

	s.Path("/transactions").Handler(middleware.AuthOnly(handlers.GetTransactions())).Methods("GET")

	return &Server{name, version, s, port}, nil
}

func (s *Server) ListenAndServe() error {
	return http.ListenAndServe(s.Port, s.Router)
}
