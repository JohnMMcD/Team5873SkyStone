#!/bin/perl -w

use strict;
$\ = "\n";

my $input_filename = $ARGV[0];
my $output_filename = $ARGV[1];

open(my $input_fh, '<',  $input_filename)  or die "Could not open input file  '$input_filename'  $!";
open(my $output_fh, '>', $output_filename) or die "Could not open output file '$output_filename' $!";

while (my $row = <$input_fh>)
{
    chomp $row;
    $row =~ s#.*dalvikvm: GC_FOR_ALLOC.*##;
    $row =~ s#.*dalvikvm: GC_CONCURRENT.*##;
    $row =~ s#.*RobotCore: BatteryChecker.*##;
    $row =~ s#.*Robocol : no packet received: NullPointerException.*##;
    next unless $row =~ m#^\S#;
    print $output_fh $row;
}

close $input_fh;
close $output_fh;
