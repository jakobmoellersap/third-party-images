//
// Created by Moeller, Jakob on 28.06.22.
//

#ifndef PLUGIN_BASE64_H
#define PLUGIN_BASE64_H

#include <stdio.h>
#include <stdlib.h>

unsigned char * base64_encode(const unsigned char *src, size_t len,
                              size_t *out_len);
unsigned char * base64_decode(const unsigned char *src, size_t len,
                              size_t *out_len);
#endif //PLUGIN_BASE64_H
