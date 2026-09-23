local ReplicatedStorage = game:GetService("ReplicatedStorage")

local controleGravidade = ReplicatedStorage:WaitForChild("ControleGravidade")
local atualizarInterface = ReplicatedStorage:WaitForChild("AtualizarInterface")

local painel = script.Parent:WaitForChild("Painel")

local textoPlaneta = painel:WaitForChild("Planeta")
local textoGravidade = painel:WaitForChild("Gravidade")
local textoTempo = painel:WaitForChild("Tempo")
local textoAltura = painel:WaitForChild("Altura")
local textoVelocidade = painel:WaitForChild("Velocidade")

local botaoTerra = painel:WaitForChild("BotaoTerra")
local botaoLua = painel:WaitForChild("BotaoLua")
local botaoMarte = painel:WaitForChild("BotaoMarte")
local botaoReiniciar = painel:WaitForChild("BotaoReiniciar")

botaoTerra.MouseButton1Click:Connect(function()
	controleGravidade:FireServer("Terra")
end)

botaoLua.MouseButton1Click:Connect(function()
	controleGravidade:FireServer("Lua")
end)

botaoMarte.MouseButton1Click:Connect(function()
	controleGravidade:FireServer("Marte")
end)

botaoReiniciar.MouseButton1Click:Connect(function()
	controleGravidade:FireServer("Reiniciar")
end)

atualizarInterface.OnClientEvent:Connect(function(
	planeta,
	gravidade,
	tempo,
	altura,
	velocidade
)
	textoPlaneta.Text = "Planeta: " .. planeta
	textoGravidade.Text = "Gravidade: " .. string.format("%.2f", gravidade) .. " m/s²"
	textoTempo.Text = "Tempo: " .. string.format("%.2f", tempo) .. " s"
	textoAltura.Text = "Altura: " .. string.format("%.2f", altura) .. " m"
	textoVelocidade.Text = "Velocidade: " .. string.format("%.2f", velocidade) .. " m/s"
end)
