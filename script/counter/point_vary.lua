return function(uid,val)
    local rp_pre = getUserConf(uid,"&reward_point_field",0)
    local rp_new = rp_pre + val
    log("reward_point|"..uid.."|"..msg.rp_pre.."->"..rp_new)
    setUserConf(uid,"&reward_point_field",rp_new)
    return rp_new
end