math.randomseed(os.time())
local random = math.random
local function uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end
function reformat(tag, timestamp, record)
    namespace, pod = string.match(tag, "(.+)_(.+)")
    new_record = {}
    new_record["id"] = uuid()
    new_record["source"] = record["application-name"]
    new_record["time"] = record["@timestamp"]
    new_record["type"] = record["audit-event-type"]
    new_record["userIdentity"]={}
    new_record["userIdentity"]["identity"] = record["tenant-id"]
    new_record["message"] = record["message"]
    new_record["fileName"]=record["file_name"]
    new_record["collector"]=record["meta.COLLECTOR_TYPE"]
    new_record["node"]=record["meta.NODE"]
    if(record["meta.NAMESPACE"] == 'dummy')
    then
        new_record["namespace"]=namespace
    else
        new_record["namespace"]=record["meta.NAMESPACE"]
    end
    if(record["meta.POD"] == 'dummy')
    then
        new_record["pod"]=pod
    else
        new_record["pod"]=record["meta.POD"]
    end
    return 1, timestamp, new_record
end