Scorpio "Test" ""

recycle = rawget(_M, "recycle") or Recycle()
lstTexture = rawget(_M, "lstTexture") or List()

function recycle:New()
    return UIParent:CreateTexture(nil, "ARTWORK")
end

function recycle:OnInit(text)
    lstTexture:Insert(text)
    text:SetTexture([[Interface\AddOns\Cube\triangle.tga]])
    text:SetVertexColor(1, 0, 0, 0.3)
    text:SetBlendMode("ADD")
end

function recycle:OnPush(text)
    text:Hide()
end

function CheckRange(value)
    return value + 1 ~= value and value >= -100 and value <= 100
end

function FillPolygon(points)
    -- Recycle all textures
    lstTexture:Each(recycle)

    -- Calc the center point
    local n = #points
    if n < 3 then return end
    local cx, cy = 0, 0

    for i = 1, n do
        local p = points[i]
        cx = cx + p.x
        cy = cy + p.y
    end
    cx = cx / n
    cy = cy / n

    -- Calc the cover areas
    local cpoints = {}
    for i = 1, n do
        local p = points[i]
        local x = p.x - cx
        local y = p.y - cy

        cpoints[i] = { x = p.x, y = p.y, r = math.sqrt(x^2 + y^2), rad = x == 0 and (y >= 0 and 90 or 270) or ((x < 0 and 180 or 360) + math.atan(y / x) * 180 / math.pi) % 360 }
    end
    table.sort(cpoints, function(a, b) return a.rad < b.rad end)

    -- Remove the same angle
    for i = n - 1, 1, - 1 do
        if cpoints[i + 1].rad - cpoints[i].rad <= 5 then
            if cpoints[i + 1].r > cpoints[i].r then
                tremove(cpoints, i)
            else
                tremove(cpoints, i + 1)
            end
        end
    end
    n = #cpoints

    -- Draw triangle for each angle
    for i = 1, n do
        local ni = i == n and 1 or i + 1
        local x1, y1, x2, y2, x3, y3 = cx, cy, cpoints[i].x, cpoints[i].y, cpoints[ni].x, cpoints[ni].y
        local lx = min(x1, x2, x3)
        local ly = min(y1, y2, y3)
        local ux = max(x1, x2, x3)
        local uy = max(y1, y2, y3)
        local dx = ux - lx
        local dy = uy - ly
        local tx3, ty1, ty2, ty3

        if dx ~= 0 and dy ~= 0 then
            if x1 == lx then
                if x2 == ux then
                    tx3, ty1, ty2, ty3 = (x3 - lx) / dx, (uy - y1), (uy - y2), (uy - y3)
                else
                    tx3, ty1, ty2, ty3 = (x2 - lx) / dx, (uy - y1), (uy - y3), (uy - y2)
                end
            elseif x2 == lx then
                if x1 == ux then
                    tx3, ty1, ty2, ty3 = (x3 - lx) / dx, (uy - y2), (uy - y1), (uy - y3)
                else
                    tx3, ty1, ty2, ty3 = (x1 - lx) / dx, (uy - y2), (uy - y3), (uy - y1)
                end
            else -- x3==lx
                if x2 == ux then
                    tx3, ty1, ty2, ty3 = (x1 - lx) / dx, (uy - y3), (uy - y2), (uy - y1)
                else
                    tx3, ty1, ty2, ty3 = (x2 - lx) / dx, (uy - y3), (uy - y1), (uy - y2)
                end
            end

            local t1 = - 0.99609375 / (ty3 - tx3 * ty2 + (tx3 - 1) * ty1) -- 0.99609375==510/512
            local t2 = dy * t1
            x1 = 0.001953125 - t1 * tx3 * ty1 -- 0.001953125=1/512
            x2 = 0.001953125 + t1 * ty1
            x3 = t2 * tx3 + x1
            y1 = t1 * (ty2 - ty1)
            y2 = t1 * (ty1 - ty3)
            y3 = - t2 + x2

            if CheckRange(x1) and CheckRange(x2) and CheckRange(x3) and CheckRange(y1) and CheckRange(y2) and CheckRange(y3) then
                local text = recycle()
                -- Use random color for test
                text:SetVertexColor(math.random(100) / 100, math.random(100) / 100, math.random(100) / 100)
                --text:SetVertexColor(1, 0, 0)

                text:ClearAllPoints()
                text:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", lx, ly)
                text:SetPoint("TOPRIGHT", UIParent, "BOTTOMLEFT", ux, uy)
                text:SetTexCoord(x1, x2, x3, y3, x1 + y2, x2 + y1, y2 + x3, y1 + y3)
                text:Show()
            end
        end
    end
end

-- Test
FillPolygon{
    { x = 430, y = 230 },
    { x = 210, y = 240 },
    { x = 560, y = 140 },
    { x = 500, y = 440 },
    { x = 500, y = 440 },
    { x = 400, y = 540 },
    { x = 200, y = 540 },
    { x = 100, y = 340 },
}