package auth

import (
	"gingonic/controllers/api/auth"
	"github.com/gin-gonic/gin"
)

func Route(r *gin.RouterGroup) *gin.RouterGroup {
	r.POST("/login", auth.Login)
	r.POST("/register", auth.Register)
	r.POST("/logout", auth.Logout)
	r.POST("/forgot-password", auth.ForgotPassword)
	r.POST("/check-login", auth.CheckIsLogin)

	return r
}
