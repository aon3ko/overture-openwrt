overture for OpenWrt
=====

configure by UCI
-----------
The UCI config file is almost same with original `config.json` file.
Every uci `section-type` called overture will become an instance, every `overture.@overture[x]` uci `option` is same with option name in `config.json`, except:
  * upstream dns
  * content in second json object
  * content in json array 

for upstream dns, create a `section-type` called `upstreamdns`. The content inside is same with before. (`EDNSClientSubnet` not added yet)
then, get the uci `cfgid` of `upstreamdns` you created and add it to overture instance using `uci add_list`.

for content in second json object, just simply attach both json option name.

for content in json array, use `uci add_list`

configure by LuCI
----------
Install luci-app-overture.
