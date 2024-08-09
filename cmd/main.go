package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/tzh21/iheart-stress-backend/internal/handler"
)

func main() {
	r := gin.Default()
	handler.SetupRoutes(r)
	fmt.Println("Server is running on port 8080 :)")
	r.Run(":8080")
}
