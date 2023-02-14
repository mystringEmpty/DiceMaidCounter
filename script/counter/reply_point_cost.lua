local rest, rp_cost = string.match(msg.suffix,"(%d*)[^%d]*(%d+)")
local obj = string.match(rest or "","%d+") or msg.fromUser
msg.obj = msg:format("{print:uid="..obj.."}")
msg.rp_pre = getUserConf(obj,"&reward_point_field",0)
if not rp_cost or #rp_cost==0 then
    rp_cost = ranint(1,100)
end
msg.rp_new = loadLua("counter.point_vary")(obj,0-rp_cost)
if rp_cost>=0 then rp_cost="+"..rp_cost end
return "{reward_point_cost}"