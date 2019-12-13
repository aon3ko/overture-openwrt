overture for OpenWrt
=====

configure by UCI
-----------
The UCI config file is almost same with original `config.json` file.
Every uci `section-type` called overture will become an instance, every `overture.@overture[x]` uci `option` is same with option name in `config.json`, except:
  * upstream dns
  * contact in second json object
  * contact in json array 

for upstream dns, you need create `section-type` called `upstreamdns`. The contact inside is same with before. (`EDNSClientSubnet` not implemented yet)
then, get the uci cfgid you created now and add it to overture instance config by `uci add_list` not `uci set`.

for contact in second json object, just simply attach both json option name.

for contact in json array, use `uci add_list`

configure by LuCI
----------
not implemented yet.
