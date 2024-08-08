package main

import (
	"github.com/gin-gonic/gin"
	"github.com/tzh21/iheart-stress-backend/internal/handler"
)

func main() {
	r := gin.Default()
	handler.SetupRoutes(r)
	r.Run(":8080")
}
