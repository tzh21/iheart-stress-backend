package main

import (
	"github.com/gin-gonic/gin"
	handler "github.com/tzh21/iheart-stress-backend/internal"
)

func main() {
	r := gin.Default()
	handler.SetupRoutes(r)
	r.Run(":8080")
}
