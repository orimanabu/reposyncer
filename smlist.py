#!/usr/bin/python
# vim: set et sts=4 sw=4 ts=4 :

import sys
import re
from pprint import pprint

def grep_list(l, r):
    if [x for x in l if re.search(r, x)]:
        return True
    return False

def parse_subscription_manager_output(f):
    f.readline()
    f.readline()
    f.readline()

    all = []
    subscr = dict()

    for line in f:
        line = line.rstrip('\n')
#        print "(debug)", line

        if line == "":
            all.append(subscr)
            subscr = dict()
#            print "length =", len(all)
        elif line.find(':') >= 0:
            key, value = line.split(':')
            subscr[key] = [re.sub(r'^\s*', '', value)]
            prev_key = key
        else:
            subscr[prev_key].append(re.sub(r'^\s*', '', line))
    return all

def print_output(data):
    for d in data:
        provides = ','.join(d['Provides'])
        #print '* id=%s, avail=%s, type=%s, provides=%s' % (d['Pool ID'][0], d['Available'][0], d['System Type'][0], provides)
        if d['Available'][0] == 'Unlimited' and d['System Type'][0] == 'Virtual':
            if grep_list(d['Provides'], r'OpenStack$'):
                print '* id=%s, avail=%s, type=%s, ends=%s' % (d['Pool ID'][0], d['Available'][0], d['System Type'][0], d['Ends'][0])
                for p in d['Provides']:
                    print "\t%s" % p

if __name__ == '__main__':
    data = parse_subscription_manager_output(sys.stdin)
    print_output(data)
