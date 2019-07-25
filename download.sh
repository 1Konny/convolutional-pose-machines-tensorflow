#! /bin/bash

function gdown(){
    # usage: gdown [id] [name]
    CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
    rm -rf /tmp/cookies.txt
}

mkdir -p models/weights
cd models/weights
gdown 0Bx1hAYkcBwqnX01MN3hoUk1kUjA cpm_body.pkl
gdown 0Bx1hAYkcBwqnSU9lSm5Ya3B1VTg cpm_hand.pkl
