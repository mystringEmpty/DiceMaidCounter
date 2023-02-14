local rest, rp_add = string.match(msg.suffix,"(%d*)[^%d]*([%-]?%d+)")
local obj = string.match(rest or "","%d+") or msg.fromUser
msg.obj = msg:format("{print:uid="..obj.."}")
msg.rp_pre = getUserConf(obj,"&reward_point_field",0)
if not rp_add or #rp_add==0 then
    rp_add = ranint(1,100)
end
msg.rp_new = loadLua("counter.point_vary")(obj,rp_add)
return "{reward_point_add}"