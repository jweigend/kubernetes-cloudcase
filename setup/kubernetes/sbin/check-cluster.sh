#!/bin/sh

pssh -i -h ${0%/*}/../conf/cluster-nodes uptime
