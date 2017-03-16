#!/usr/bin/perl

use strict;
use warnings;
use DBI;
use DBD::Oracle;

#$ENV{ORACLE_HOME} = "/usr/lib/oracle/12.1/client64";
#declare your ORACLE_HOME in the script... (not the problem here but it could become a problem later on)

my $host="52.22.38.22";
my $user="bpfordi";
my $pass="test123";

my $dbh = DBI->connect("dbi:Oracle:host=$host;sid=testdb;port=1521",$user, $pass, { RaiseError => 1, AutoCommit => 0 });



print "Content-type: text/html\n\n";


my $sth0 = $dbh->prepare("SELECT * from tab") or die "Couldn't prepare 1st statement: " . $dbh->errstr;
$sth0->execute;
while (my @data = $sth0->fetchrow_array()) {
     my $column1 = $data[0];
     my $column2 = $data[1]; 
  print $column1 . "\t" . $column2;
 }
 $sth0->finish;
$dbh->disconnect;
