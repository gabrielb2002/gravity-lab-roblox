local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local controleGravidade = ReplicatedStorage:WaitForChild("ControleGravidade")
local atualizarInterface = ReplicatedStorage:WaitForChild("AtualizarInterface")

local ALTURA_INICIAL = 50
local gravidade = 9.81
local planeta = "Terra"

local bola = workspace:WaitForChild("Bola")

local altura = ALTURA_INICIAL
local velocidade = 0
local tempo = 0
local simulando = true

bola.Anchored = true
bola.Position = Vector3.new(0, ALTURA_INICIAL, 0)

local function reiniciar()
	altura = ALTURA_INICIAL
	velocidade = 0
	tempo = 0
	simulando = true

	bola.Position = Vector3.new(
		bola.Position.X,
		ALTURA_INICIAL,
		bola.Position.Z
	)
end

controleGravidade.OnServerEvent:Connect(function(player, comando)
	if comando == "Terra" then
		planeta = "Terra"
		gravidade = 9.81
		reiniciar()
	elseif comando == "Lua" then
		planeta = "Lua"
		gravidade = 1.62
		reiniciar()
	elseif comando == "Marte" then
		planeta = "Marte"
		gravidade = 3.71
		reiniciar()
	elseif comando == "Reiniciar" then
		reiniciar()
	end
end)

local function atualizar(deltaTime)
	if not simulando then
		return
	end

	tempo = tempo + deltaTime
	velocidade = velocidade - gravidade * deltaTime
	altura = altura + velocidade * deltaTime

	if altura <= 1 then
		altura = 1
		velocidade = 0
		simulando = false
	end

	bola.Position = Vector3.new(
		bola.Position.X,
		altura,
		bola.Position.Z
	)

	atualizarInterface:FireAllClients(
		planeta,
		gravidade,
		tempo,
		altura,
		velocidade
	)
end

RunService.Heartbeat:Connect(atualizar)
