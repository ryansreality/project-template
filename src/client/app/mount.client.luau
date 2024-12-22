local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.packages.vide)
local app = require(script.Parent.app)

local mount = vide.mount

mount(app, Players.LocalPlayer.PlayerGui)