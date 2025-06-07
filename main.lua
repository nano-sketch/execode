L=loadstring(game:HttpGet("https://raw.githubusercontent.com/matas3535/PoopLibrary/main/Library.lua"))()
local function p()local s=Instance.new("Sound")s.SoundId="rbxassetid://6176359187"s.Volume=0.5 s.Parent=game.CoreGui s:Play()game.Debris:AddItem(s,1)end
local function w(c)return function(...)p()if c then c(...)end end end
local P,S,U,C=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),workspace.CurrentCamera
local fE,fS,fC,nE,nC,eE=false,100,nil,false,nil,false
local h,t={},{}
local cW=16
local function f()
local p=P.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local h=c:WaitForChild("HumanoidRootPart")
if h:FindFirstChild("FlyVelocity")then h.FlyVelocity:Destroy()end
local v=Instance.new("BodyVelocity")
v.Name="FlyVelocity"v.MaxForce=Vector3.new(1e9,1e9,1e9)v.Parent=h
fC=S.Heartbeat:Connect(function()if not fE or not h.Parent then v:Destroy()if fC then fC:Disconnect()end fC=nil return end
local d=Vector3.zero
if U:IsKeyDown(Enum.KeyCode.W)then d+=C.CFrame.LookVector end
if U:IsKeyDown(Enum.KeyCode.S)then d-=C.CFrame.LookVector end
if U:IsKeyDown(Enum.KeyCode.A)then d-=C.CFrame.RightVector end
if U:IsKeyDown(Enum.KeyCode.D)then d+=C.CFrame.RightVector end
if U:IsKeyDown(Enum.KeyCode.Space)then d+=Vector3.new(0,1,0)end
if U:IsKeyDown(Enum.KeyCode.LeftControl)then d-=Vector3.new(0,1,0)end
v.Velocity=(d.Magnitude>0 and d.Unit*fS)or Vector3.zero end)end
local function n()
nC=S.Stepped:Connect(function()if not nE then if nC then nC:Disconnect()nC=nil end return end
local p=P.LocalPlayer
local c=p.Character
if c then for _,v in ipairs(c:GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end end end)end
local function sWS(s)local p=P.LocalPlayer if p.Character then local h=p.Character:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=s end end end
local function cA(c)if fE then f()end sWS(cW)end
P.LocalPlayer.CharacterAdded:Connect(cA)
local aE,aC=false,nil
local lR,sM=60,0.1
local fps=Drawing.new("Text")
fps.Size=18 fps.Color=Color3.fromRGB(0,255,0)fps.Outline=true fps.Position=Vector2.new(workspace.CurrentCamera.ViewportSize.X-100,20)fps.Visible=false
local lU=os.clock()local fC2=0 local cFPS=0
local function wTS(o)local s=C:WorldToScreenPoint(o.Position)return Vector2.new(s.X,s.Y)end
local function mP()return Vector2.new(P.LocalPlayer:GetMouse().X,P.LocalPlayer:GetMouse().Y)end
local function gC(r)local c,n=nil,r or math.huge
for _,p in pairs(P:GetPlayers())do if p~=P.LocalPlayer and p.Character and p.Character:FindFirstChildOfClass("Humanoid")and p.Character.Humanoid.Health>0 then local t=p.Character:FindFirstChild("UpperTorso")or p.Character:FindFirstChild("Torso")or p.Character:FindFirstChild("HumanoidRootPart")if t then local d=(wTS(t)-mP()).Magnitude if d<n then n=d c=p end end end end return c,n end
local function sA(c,t,s)local d=(t-c.Position).Unit local n=c.LookVector:Lerp(d,s)return CFrame.new(c.Position,c.Position+n)end
local function aL()if aC then aC:Disconnect()end
aC=S.RenderStepped:Connect(function(dt)fC2+=1 if os.clock()-lU>=1 then cFPS=fC2 fC2=0 lU=os.clock()fps.Text="FPS: "..tostring(cFPS)end
if not aE then fps.Visible=false return end fps.Visible=true
local p=P.LocalPlayer
if p.Character and p.Character:FindFirstChild("HumanoidRootPart")and p.Character:FindFirstChild("Humanoid")then local tp,d=gC(lR)if tp and d<=lR then if tp.Character and tp.Character:FindFirstChild("HumanoidRootPart")and tp.Character:FindFirstChild("Humanoid")then local tr=tp.Character.HumanoidRootPart local tm=tp.Character.Humanoid.MoveDirection local aP=tr.Position+(tm*2)
C.CFrame=sA(C.CFrame,aP,sM)end end end end)end
local function sAL()if aC then aC:Disconnect()aC=nil end fps.Visible=false end
local W=L:New({Name="nx",Accent=Color3.fromRGB(25,240,100)})
W.uibind=Enum.KeyCode.Zero
local oF=W.Fade
W.Fade=function(...)p()return oF(...)end
local M=W:Page({Name="Main"})
local MS=M:Section({Name="Fly & Walk Settings",Side="Left"})
local MI=M:Section({Name="Misc",Side="Right"})
MS:Toggle({Name="fly",Default=false,Pointer="Fly_Enabled",Callback=w(function(s)fE=s if fE then f()else if fC then fC:Disconnect()fC=nil end local p=P.LocalPlayer if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local v=p.Character.HumanoidRootPart:FindFirstChild("FlyVelocity")if v then v:Destroy()end end end end)})
MS:Slider({Name="walkspeed",Minimum=10,Maximum=200,Default=16,Decimals=1,Pointer="Walk_Speed",Callback=w(function(v)cW=v sWS(v)end)})
MI:Toggle({Name="noclip",Default=false,Pointer="Noclip_Enabled",Callback=w(function(s)nE=s if nE then n()else if nC then nC:Disconnect()nC=nil end end end)})
local oR,oS,oE,oC=2,math.pi*2,false,nil
local function o()
local p=P.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local h=c:WaitForChild("HumanoidRootPart")
local a=0 local t=nil
local function gT()local n=math.huge local c=nil for _,p in pairs(P:GetPlayers())do if p~=P.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local d=(h.Position-p.Character.HumanoidRootPart.Position).Magnitude if d<n then n=d c=p end end end return c end
oC=S.RenderStepped:Connect(function(dt)if not oE or not h.Parent then if oC then oC:Disconnect()oC=nil end return end
t=gT()if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")then a=(a+oS*dt)%(2*math.pi)local p=t.Character.HumanoidRootPart.Position
local o=Vector3.new(math.cos(a)*oR,0,math.sin(a)*oR)
h.CFrame=CFrame.new(p+o,p)end end)end
local function sO()if oC then oC:Disconnect()oC=nil end end
MI:Toggle({Name="Orbit Nearest Player",Default=false,Pointer="Orbit_Enabled",Callback=w(function(s)oE=s if oE then o()else sO()end end)})
local function uE()for p,h in pairs(h)do if not p or not p.Parent then if h then h:Destroy()end h[p]=nil end end
if not eE then for p,h in pairs(h)do if h then h:Destroy()end end h={}return end
for _,p in pairs(P:GetPlayers())do if p~=P.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart")and p.Character:FindFirstChildOfClass("Humanoid").Health>0 then if not h[p]then local H=Instance.new("Highlight")H.Name="ESP_Highlight"H.FillColor=Color3.fromRGB(255,0,0)H.FillTransparency=0.5 H.OutlineColor=Color3.fromRGB(255,255,255)H.OutlineTransparency=0 H.Adornee=p.Character H.Parent=game:GetService("CoreGui")h[p]=H else h[p].Adornee=p.Character end else if h[p]then h[p]:Destroy()h[p]=nil end end end end
game:GetService("RunService").Heartbeat:Connect(function()if eE then uE()else for p,h in pairs(h)do if h then h:Destroy()end end h={}end end)
MI:Toggle({Name="esp",Default=false,Pointer="ESP_Enabled",Callback=w(function(s)eE=s end)})
MI:Toggle({Name="texturesoff",StartingState=false,Callback=function(s)if s then for _,o in pairs(workspace:GetDescendants())do if o:IsA("Texture")or o:IsA("Decal")then o:Destroy()end end end end})
MI:Toggle({Name="smooth aim",Default=false,Pointer="Aimbot_Enabled",Callback=w(function(s)aE=s if aE then aL()else sAL()end end)})
W:Initialize()
