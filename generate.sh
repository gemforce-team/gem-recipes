#!/bin/bash

bc() {
    rm -f -- bleed-combine/bc*.txt
    scripts/bc.sh 32 $((1<<21))
}

cc() {
    rm -f -- crit-combine/cc*.txt
    scripts/cc.sh 8 1024 table_crit
    scripts/cc.sh 2048 $((1<<19)) table_critcomb
}

ka() {
    rm -f -- gccs/killgem-amps/ka*.txt
    scripts/ka.sh 8 64 table_kgsexact
    scripts/ka.sh 128 128 table_kgsappr
    scripts/ka.sh 256 256 table_mgsexact
    scripts/ka.sh 512 512 table_kgssemi
    scripts/ka.sh 1024 2048 table_mgsappr
}

kc() {
    rm -f -- gccs/killgem-combine/kc*.txt
    scripts/kc.sh 8 512 table_kgcexact
    scripts/kc.sh 1024 $((1<<18)) table_kgcomb
}

ko() {
    rm -f -- gccs/killgem-omnia/ko*.txt
    scripts/ko.sh 2048 1024 table_mgsappr table_crit table_kgcomb
    scripts/ko.sh 2048 262144 table_mgsappr table_kgcomb table_kgcomb
    scripts/ko.sh 2048 524288 table_mgsappr table_critcomb table_critcomb
}

lc() {
    rm -f -- leech-combine/lc*.txt
    scripts/lc.sh 8 $((1<<23))
}

ma() {
    rm -f -- gccs/managem-amps/ma*.txt
    scripts/ma.sh 8 256 table_mgsexact
    scripts/ma.sh 512 2048 table_mgsappr
    scripts/ma.sh 2048 2048 table_mgsappr 120
    scripts/ma.sh 2048 2048 table_mgsappr 240
}

mc() {
    rm -f -- gccs/managem-combine/mc*.txt
    scripts/mc.sh 8 2048 table_mgcexact
    scripts/mc.sh 4096 $((1<<19)) table_mgcomb
    scripts/mc.sh $((1<<20)) $((1<<23)) table_leech
}

mo() {
    rm -f -- gccs/managem-omnia/mo*.txt
    scripts/mo.sh 2048 2048 table_mgcexact
    scripts/mo.sh 2048 32768 table_mgcappr
    scripts/mo.sh 2048 524288 table_mgcomb
}
