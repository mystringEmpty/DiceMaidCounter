local rest, rp_new = string.match(msg.suffix,"(%d*)[^%d]*([%-]?%d+)")
local obj = string.match(rest or "","%d+") or msg.fromUser
msg.obj = msg:format("{print:uid="..obj.."}")
msg.rp_pre = getUserConf(obj,"&reward_point_field",0)
if not rp_new or #rp_new==0 then
    setUserConf(obj,"&reward_point_field",rp_new)
    return "{reward_point_clear}"
end
setUserConf(obj,"&reward_point_field",rp_new)
msg.rp_new = rp_new
log("reward_point|"..msg.obj.."|"..msg.rp_pre.."->"..rp_new)
return "{reward_point_rewrite}"