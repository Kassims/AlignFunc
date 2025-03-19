    local align = {}
    local doitexclusive = {}
    function align.make(i,v,rotation,position)
    i:BreakJoints()
    local TBL = {i,v,v.CFrame,CFrame.new(position)*CFrame.Angles(math.rad(rotation.X),math.rad(rotation.Y),math.rad(rotation.Z))}
    table.insert(doitexclusive,TBL)
    end
    
    spawn(function()
    while task.wait() do
    
    local globalrand = math.sin(os.clock())/1000
    
    for i,v in pairs(doitexclusive) do
    if doitexclusive[i][1] ~= nil and  doitexclusive[i][1].Parent ~= nil and doitexclusive[i][2] ~= nil and  doitexclusive[i][2].Parent ~= nil and doitexclusive[i][3] ~= nil and typeof(doitexclusive[i][3]) == "CFrame" and doitexclusive[i][4] ~= nil and typeof(doitexclusive[i][4]) == "CFrame" then
    local real = doitexclusive[i][1]
    local fake = doitexclusive[i][2]
    local lastcf = doitexclusive[i][3]
    local offset = doitexclusive[i][4]
    local curcf = fake.CFrame
    local newcf = CFrame.new()
    newcf = (curcf*CFrame.new(globalrand,0,-globalrand))*(offset:Inverse())
    local buildi = -((lastcf.Position-newcf.Position)*1000)
    real.CFrame = newcf
    real.Velocity = Vector3.new(buildi.X,50,buildi.Z)
    real.RotVelocity = Vector3.new(0,0,0)
    doitexclusive[i][3] = newcf
    else
    table.remove(doitexclusive,i)
    end
    end
    
    end
    end)