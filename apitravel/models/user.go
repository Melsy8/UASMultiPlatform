package models

import "time"

type User struct {
	ID        uint   `gorm:"primaryKey"`
	Username  string `gorm:"unique"`
	Email     string `gorm:"unique"`
	Password  string
	Name      string
	CreatedAt time.Time `gorm:"autoCreateTime"`
}
