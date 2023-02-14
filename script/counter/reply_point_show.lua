local rp=getUserConf(msg.uid,"&reward_point_field")
if not rp then
    return "{reward_point_empty}"
elseif rp<0 then
    msg.rp_debt = 0-rp
    return "{reward_point_debt}"
else
    msg.rp_curr = rp
    return "{reward_point_show}"
end