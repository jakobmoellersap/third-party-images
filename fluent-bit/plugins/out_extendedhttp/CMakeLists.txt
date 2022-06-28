set(src
    extended_http.c
    extended_http_conf.c
        base64.c
        )

FLB_PLUGIN(out_extendedhttp "${src}" "")