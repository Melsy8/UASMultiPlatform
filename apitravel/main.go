package main

import (
	"apitravel/config"
	"apitravel/controllers"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	config.ConnectDatabase()

	r.POST("/register", controllers.Register)
	r.POST("/login", controllers.Login)
	r.PUT("/update-profile", controllers.UpdateProfile)
	r.PUT("/change-password", controllers.ChangePassword)
	r.GET("/user/:id", controllers.GetUser)
	r.DELETE("/user/:id", controllers.DeleteUser)
	r.GET("/users", controllers.GetAllUsers)
	r.Run(":8080")
}
