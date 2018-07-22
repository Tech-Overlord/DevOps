#!/usr/bin/python

# If python binaries are located on a different path than the one above, then change the interpreter above on line 1.

import dns.resolver
# make sure that you have the library/binary for dns.resolver installed. On linux systems, you can install it by: pip install python

resolver = dns.resolver.Resolver()

# We are fetching the A type DNS records by querying google.com. You can modify and change to the desired record type.
resolver_get_data = resolver.query("google.com", "A")
for rdata in resolver_get_data: 
   print rdata